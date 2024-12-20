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
    <title>Sign in</title>
</head>
<body>
    <header>
        <h1>Sign in</h1>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto+Mono:wght@100&display=swap" rel="stylesheet">
        <div class="button-container">
            <a href="main.html" class="button">Main</a>
            
        </div>
    </header>
    <main>
        <form action="signinin.php" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="example@example.com" required><br>

            <label for="password">Password:</label>
            <input type="password" id="password" pattern="[A-Za-z0-9]+"  name="password" placeholder="Only letters and numbers" required><br>

            <input type="submit" class="submit" value="Sign in" >
        </form>
    </main>
    <footer>
        <p>© 2 0 2 4 </p>
    </footer>
</body>
</html>
