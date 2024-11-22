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
    <title>Authorization</title>
</head>
<body>
    <header>
        <h1>Authorization</h1>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto+Mono:wght@100&display=swap" rel="stylesheet">
        <div class="button-container">
            <a href="main.html" class="button">Main</a>
            
        </div>
    </header>
    <main>
        <div class="button-container">
            <a href="register.php?redirect_url=<?php echo urlencode($redirect_url); ?>" class="button">Registrarion</a>
            <a href="signin.php?redirect_url=<?php echo urlencode($redirect_url); ?>" class="button">Sign in</a>

    </main>
    <footer>
        <p>© 2 0 2 4 </p>
    </footer>
</body>
</html>
