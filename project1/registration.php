<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "restaurantdb1";

$conn = new mysqli($servername, $username, $password, $dbname);
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $password = $_POST['password'];
    $key = 'key'; 

    if (!preg_match("/^[a-zA-Z]+$/", $firstname)) {
        die("Error: first name only letters");
    }

    if (!preg_match("/^[a-zA-Z]+$/", $lastname)) {
        die("Error: last name only letters");
    }

    if (!preg_match("/^\d{11}$/", $phone)) {
        die("Error: wrong number dialed");
    }

    if (!preg_match('/^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]{2,}$/', $email)) {
        die("Error: wrong email");
    }

    if (!preg_match("/^[A-Za-z0-9]+$/", $password)) {
        die("Error: password only letters and digits");
    }

    $stmt = $conn->prepare("SELECT customerid FROM customers WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "A user with this email is already registered.";
        return;
    }


    $stmt1 = $conn->prepare("INSERT INTO customers (firstname, lastname, email, phone) VALUES (?, ?, ?, ?)");
    $stmt1->bind_param("ssss", $firstname, $lastname, $email, $phone);
    $stmt1->execute();

    $customerID = $conn->insert_id;

    $stmt2 = $conn->prepare("INSERT INTO customerspasswords (passwordencrypt) VALUES ( AES_ENCRYPT(?, ?))");
    $stmt2->bind_param("ss",  $password, $key);
    $stmt2->execute();

    if ($stmt1->affected_rows > 0 && $stmt2->affected_rows > 0) {
        $_SESSION['customerid'] = $customerID;
        echo "Welcome, customer ID: " . $customerID;
    } else {
        echo "Error: Could not register user.";
    }
    $stmt1->close();
    $stmt2->close();


    if (isset($redirect_url)){
        $redirect_url = isset($_GET['redirect_url']) ? $_GET['redirect_url'] : 'order-check.php';
        header("Location: " . $redirect_url); 
        exit();
    }
    else{
        $redirect_url = isset($_GET['redirect_url']) ? $_GET['redirect_url'] : 'main.html';
        header("Location: " . $redirect_url); 
        exit();
        }
}

$conn->close();
?>