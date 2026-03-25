<?php
session_start();
if (isset($_SESSION['user_name'])) {
    header("Location: dashboard.php");
    exit;
}
?>

<h2>Welcome to Resume Generator</h2>
<a href="register.php">Register</a> | <a href="login.php">Login</a>
