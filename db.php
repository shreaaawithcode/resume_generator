<?php
$dsn = "mysql:host=127.0.0.1;port=3306;dbname=resume_generation";
$username = "root";
$password = "purna@2005";

try {
    $conn = new PDO($dsn, $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

?>


