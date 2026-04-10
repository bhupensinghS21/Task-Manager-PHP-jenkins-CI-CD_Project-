<?php

echo "DEBUG: contact.php reached<br>";

include "config/db.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    echo "DEBUG: POST request received<br>";

    $name = $_POST['name'] ?? '';
    $designation = $_POST['designation'] ?? '';
    $task = $_POST['task'] ?? '';

    echo "DEBUG DATA:<br>";
    echo "Name: $name<br>";
    echo "Designation: $designation<br>";
    echo "Task: $task<br>";

    if (!$name || !$designation || !$task) {
        die("ERROR: Missing fields");
    }

    $sql = "INSERT INTO tasks (name, designation, task) 
            VALUES ('$name', '$designation', '$task')";

    if ($conn->query($sql) === TRUE) {
        echo "SUCCESS: Data inserted into MySQL";
    } else {
        echo "MYSQL ERROR: " . $conn->error;
    }

} else {
    echo "ERROR: Invalid request method";
}

?>
