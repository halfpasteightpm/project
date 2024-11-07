<?php
$servername = "localhost"; 
$username = "root";
$password = ""; 
$dbname = "restaurantdb1"; 


$conn = new mysqli($servername, $username, $password, $dbname);

$sql="select menuitemname,descriptionitem,price,weight from menuitems";
$result=$conn->query($sql);
?>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Menu</title>
    
</head>
<body>
    <header>
        <h1>Menu</h1>
        <div class="button-container">
            <a href="main.html" class="button">Main</a>
            
        </div>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto+Mono:wght@100&display=swap" rel="stylesheet">
        
    </header>
    
    <main>
    <table>
        <tr>
            <td></td>
            <td>Price</td>
            <td>Weight</td>
        </tr>
        <?php
        if ($result->num_rows>0){
            while ($row= $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>".$row["menuitemname"]."</td>";
                echo "<td>".$row["price"]."  </td>";
                echo "<td>".$row["weight"]." </td>";
                echo "</tr>";                }
            }
        ?>
    </table>

    </main>
    <footer>
        <p>© 2 0 2 4 OCHEN MNOGO SWAGA</p>
    </footer>
</body>
</html>
<?php
$conn->close();
?>