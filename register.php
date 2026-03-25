<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['user_name'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $stmt = $conn->prepare("INSERT INTO User (user_name, password) VALUES (?, ?)");
    $stmt->execute([$name, $password]);
    $user_id = $conn->lastInsertId();
    echo "Registration successful! <a href='login.php'>Login here</a>";
}
?>

<h2>Register</h2>
<form method="POST">
    Username: <input type="text" name="user_name" required><br>
    Password: <input type="password" name="password" required><br>
    <button type="submit">Register</button>
</form>
