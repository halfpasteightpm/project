<?php
$servername = "localhost"; 
$username = "root";
$password = ""; 
$dbname = "restaurantdb1"; 


$conn = new mysqli($servername, $username, $password, $dbname);

$sql="select menuitemid,menuitemname,price from menuitems";
$result=$conn->query($sql);
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Order</h1>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto+Mono:wght@100&display=swap" rel="stylesheet">
        <div class="button-container">
            <a href="main.html" class="button">Main</a>
        </div>
    </header>
    

<?php
$conn->close(); 
?>
    <main>
    <div class="order-form">
       <form action="submit_order.php" method="POST">
          <?php
          if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo '<div class="form-group">';
                    echo '<label for="product-' . $row["menuitemid"] . '">' . $row["menuitemname"] . ' ' . $row["price"] . ' </label>';
                    echo '<input type="number" id="product-' . $row["menuitemid"] . '" name="quantities[' . $row["menuitemid"] . ']" min="0" value="0">';
                    echo '</div>';
                }
           } 
            ?>
            <div class="form-group">
                <input type="submit" value="Confirm">
            </div>
        </form>
    </div>
    </main>
    <footer>
        <p>© 2 0 2 4 </p>
    </footer>
</body>
    
</html>
