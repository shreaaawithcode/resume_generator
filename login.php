<?php
require 'db.php';
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['user_name'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM User WHERE user_name = ?");
    $stmt->execute([$name]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['user_name'] = $user['user_name'];
        header("Location: dashboard.php");
        exit;
    } else {
        echo "Invalid credentials.";
    }
}
?>
<h2>Login</h2>
<form method="POST">
    Username: <input type="text" name="user_name" required><br>
    Password: <input type="password" name="password" required><br>
    <button type="submit">Login</button>
</form>
