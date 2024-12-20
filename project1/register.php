<?php

session_start();

$redirect_url = isset($_GET['redirect_url']) ? $_GET['redirect_url'] : '/default.php';

?>
<!DOCTYPE html>
<html lang="eng">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Registrarion</title>
</head>
<body>
    <header>
        <h1>Registration</h1>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto+Mono:wght@100&display=swap" rel="stylesheet">
        <div class="button-container">
            <a href="main.html" class="button">Main</a>
            
        </div>
    </header>
    <main>
        <form action="registration.php" method="post">
            <label for="firstname" >First name:</label>
            <input type="text" id="firstname" pattern="[A-Za-z]+" name="firstname" placeholder="Only letters" required><br>

            <label for="lastname">Last name:</label>
            <input type="text" id="lastname" pattern="[A-Za-z]+" name="lastname" placeholder="Only letters" required><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required placeholder="example@example.com"><br>

            <label for="phone">Phone:</label>
            <input type="phone" id="phone" pattern="\d{11}" maxlength="11" name="phone"  placeholder="11 digits" required><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password"pattern="[A-Za-z0-9]+" name="password" placeholder="Only letters and numbers"><br>

            <input type="submit" class="submit" value="Register">
    </form>
    </main>
    <footer>
        <p>© 2 0 2 4 </p>
    </footer>
</body>
</html>
