<?php
include "config.php";

$name = $_POST['name'];
$designation = $_POST['designation'];
$task = $_POST['task'];

$conn->query("INSERT INTO tasks (name, designation, task) VALUES ('$name', '$designation', '$task')");

header("Location: index.php");
?>
