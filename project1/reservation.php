<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "restaurantdb1";

$conn = new mysqli($servername, $username, $password, $dbname);


session_start();

if (!isset($_SESSION['customerid'])) {
    $redirect_url = $_SERVER['REQUEST_URI'];
    header("Location: registersignin.php?redirect_url=" . urlencode($redirect_url));
    exit();
}

if (!isset($_SESSION['customerid'])) {
    $redirect_url = $_SERVER['REQUEST_URI'];
    header("Location: registersignin.php?redirect_url=" . urlencode($redirect_url));
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $customerid = $_SESSION['customerid'];
    $reservationdate = $_POST['reservationdate'];


    $currentDateTime = new DateTime();
    $twoHoursLater = clone $currentDateTime;
    $twoHoursLater->add(new DateInterval('PT2H'));


    $reservationDateTime = new DateTime($reservationdate);

    if ($reservationDateTime >= $currentDateTime && $reservationDateTime <= $twoHoursLater) {
        

        $currentFormatted = $currentDateTime->format('Y-m-d H:i:s');
        $twoHoursLaterFormatted = $twoHoursLater->format('Y-m-d H:i:s');


        $stmt = $conn->prepare("SELECT COUNT(*) FROM reservations WHERE reservationdate BETWEEN ? AND ?");
        $stmt->bind_param("ss", $currentFormatted, $twoHoursLaterFormatted);
        $stmt->execute();
        $stmt->bind_result($count);
        $stmt->fetch();
        $stmt->close();

        if ($count > 10) {
            echo "Choose a different time. There are already bookings within the next two hours.";
        } else {
            $insertStmt = $conn->prepare("INSERT INTO reservations (customerid, reservationdate) VALUES (?, ?)");
            $insertStmt->bind_param("is", $customerid, $reservationdate);
            if ($insertStmt->execute()) {
                echo "Booking successful";
            }
            $insertStmt->close();
        }
    } else {

        $insertStmt = $conn->prepare("INSERT INTO reservations (customerid, reservationdate) VALUES (?, ?)");
        $insertStmt->bind_param("is", $customerid, $reservationdate);
        if ($insertStmt->execute()) {
            echo "Booking successful";
        }
        $insertStmt->close();
    }
}

?>

<!DOCTYPE html>
<html lang="eng">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Reservation</title>
</head>
<body>
    <header>
        <h1>Reservation</h1>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto+Mono:wght@100&display=swap" rel="stylesheet">
        <div class="button-container">
            <a href="main.html" class="button">Main</a>
        </div>
    </header>

    <main>
        <form action="" method="post">
            <label for="reservationdate">select time to book:</label>
            <input type="datetime-local" name="reservationdate" id="reservationdate" required>
            <br>
            <input type="submit" value="book">
        </form>
    </main>

    <footer>
        <p>© 2 0 2 4 </p>
    </footer>
</body>
</html>
