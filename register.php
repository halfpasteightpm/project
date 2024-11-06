<?php
$servername = "localhost"; // адрес сервера
$username = "root"; // имя пользователя
$password = ""; // пароль
$dbname = "restaurantdb1"; // имя базы данных

// Создание подключения
$conn = new mysqli($servername, $username, $password, $dbname);

$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$email = $_POST['email'];
$phone = $_POST['phone'];

// Подготовка и выполнение SQL-запроса
$stmt = $conn->prepare("INSERT INTO customers (firstname, lastname, email, phone) VALUES (?, ?, ?,?)");
$stmt->bind_param("ssss", $firstname, $lastname, $email, $phone); // "sss" означает, что все три параметра - строковые

if ($stmt->execute()) {
    echo "Данные успешно сохранены.";
} else {
    echo "Ошибка: " . $stmt->error;
}

// Закрытие соединения
$stmt->close();
$conn->close();

?>