<?php
$servername = "localhost"; 
$username = "root";
$password = ""; 
$dbname = "restaurantdb1"; 


$conn = new mysqli($servername, $username, $password, $dbname);



if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $email = $_POST['email'];
    $password = $_POST['password'];

    if (!preg_match('/^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]{2,}$/', $email)) {
        die("Error: wrong email ");
    }
    if (!preg_match("/^[A-Za-z0-9]+$/", $password)) {
        die("Error: first name only letters");
    }

    $stmt = $conn->prepare("SELECT customerid FROM customers WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    
    $result = $stmt->get_result();
    $customer = $result->fetch_assoc();
    if ($customer) {
        $stmt = $conn->prepare("SELECT AES_DECRYPT(passwordencrypt, 'key') AS decrypted_password FROM customerspasswords WHERE passwordid = ?");
        $stmt->bind_param("i", $customer['customerid']);
        $stmt->execute();
        $result = $stmt->get_result();
    
        if ($psswrd = $result->fetch_assoc()) {
            $decryptedPassword = $psswrd['decrypted_password'];
    
            // Сравнение пароля
            if ($password === $decryptedPassword) {
                echo "Y!";
            } else {
                echo "Wrond password";
            }
        } else {
            echo "Ошибка получения учетных данных.";
        }
    }
    else {
        echo "net takogo email";
    }
    $stmt->close();
}