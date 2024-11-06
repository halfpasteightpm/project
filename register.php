<?php
$servername = "localhost"; 
$username = "root";
$password = ""; 
$dbname = "restaurantdb1"; 


$conn = new mysqli($servername, $username, $password, $dbname);

$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$email = $_POST['email'];
$phone = $_POST['phone'];

$stmt = $conn->prepare("INSERT INTO customers (firstname, lastname, email, phone) VALUES (?, ?, ?,?)");
$stmt->bind_param("ssss", $firstname, $lastname, $email, $phone); // "sss" означает, что все три параметра - строковые

if ($stmt->execute()) {
    echo "Данные успешно сохранены.";
} else {
    echo "Ошибка: " . $stmt->error;
}

$stmt->close();
$conn->close();

?>
