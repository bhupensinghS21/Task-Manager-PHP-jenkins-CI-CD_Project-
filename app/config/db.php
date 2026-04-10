<?php

echo "DEBUG: db.php loaded<br>";

$host = "mysql";
$user = "root";
$password = "root123";
$database = "devopsdb";

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("DB CONNECTION FAILED: " . $conn->connect_error);
}

echo "DEBUG: DB connected successfully<br>";

?>
