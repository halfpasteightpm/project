<?php
$servername = "localhost"; 
$username = "root";
$password = ""; 
$dbname = "restaurantdb1"; 


$conn = new mysqli($servername, $username, $password, $dbname);
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $customerid = $_SESSION['customerid'];
    if (isset($_POST['quantities']) && is_array($_POST['quantities'])) {
        $quantities = $_POST['quantities'];
        $address=$_POST['address'];
        $menuItems = [];
        $totalCost = 0;
        foreach ($quantities as $menuitemid => $quantity) {
            if ($quantity > 0) {
                $stmt = $conn->prepare("SELECT menuitemname, price FROM menuitems WHERE menuitemid = ?");
                $stmt->bind_param("i", $menuitemid);
                $stmt->execute();
                $result = $stmt->get_result();
                if ($row = $result->fetch_assoc()) {
                    $name = $row['menuitemname'];
                    $price = $row['price']; 
                    $menuItems[$menuitemid] = [
                        'name' => $name,
                        'price' => $price,
                        'quantity' => $quantity,
                        'total' => $price * $quantity 
                    ];
                    $totalCost += $menuItems[$menuitemid]['total'];
                    $itemsText = "";
                     foreach ($menuItems as $name) {
                        $itemsText .= $name['name'] . " - " . $name['quantity'] . ", ";
                    }
                    $itemsText = rtrim($itemsText, ", "); 
                    $insertStmt = $conn->prepare("INSERT INTO orders (Customerid, items, address, TotalAmount) VALUES (?, ?, ?, ?)");
                    $insertStmt->bind_param("issd", $customerid, $itemsText, $address, $totalCost);
                    $insertStmt->execute();
                }
            }
        }
        
    } else {
        echo "No items were ordered.";
    }
}
?>

<!DOCTYPE html>
<html lang="eng">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Your order</title>
</head>
<body>
    <header>
        <h1>Your order</h1>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto+Mono:wght@100&display=swap" rel="stylesheet">
        <div class="button-container">
            <a href="main.html" class="button">Main</a>
            
        </div>
    </header>
    <main>
        <form action="pay.php" method="post">
            <?php
            if (!empty($menuItems)) {
                echo "ADRESS: ".$address. "<br>";
                foreach ($menuItems as $menuitemid => $name) {
                    echo $name['name'] . " - Quantity: " . $name['quantity'] . " - Price: " . $name['price']. "<br>";
                }
                echo "Total: " . number_format($totalCost, 2). "<br>"; 
            } else {
                echo "No items were ordered.";
            }
            
            ?>
            <input type="submit" class="submit" value="Pay" >
        </form>
    </main>
    <footer>
        <p>© 2 0 2 4 </p>
    </footer>
</body>
</html>