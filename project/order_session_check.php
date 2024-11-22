<?php
$servername = "localhost"; 
$username = "root";
$password = ""; 
$dbname = "restaurantdb1"; 


$conn = new mysqli($servername, $username, $password, $dbname);
session_start(); // Начало сессии

// Проверяем, вошел ли пользователь в систему
if (isset($_SESSION['customerid'])) {
    // Если пользователь вошел в систему, перенаправляем на submit_order.php
    header("Location: submit_order.php");
    exit(); // Завершаем скрипт, чтобы избежать дальнейшего выполнения
} else {
    // Если пользователь не вошел в систему, перенаправляем на страницу регистрации
    header("Location: register.php");
    exit(); // Завершаем скрипт
}
?>