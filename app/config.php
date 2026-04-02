<?php
$host = "mysql";   // container name (important)
$port = 3306;
$user = "admin";
$pass = "solutionara123";
$db   = "tasks_db";

$conn = new mysqli($host, $user, $pass, $db, $port);

if ($conn->connect_error) {
    die("DB Connection Failed: " . $conn->connect_error);
}
?>
