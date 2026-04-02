<?php include "config.php"; ?>
<!DOCTYPE html>
<html>
<head>
<title>Task Manager</title>
<style>
body { font-family: Arial; background:#f4f6f9; }
.container { width:50%; margin:auto; background:white; padding:20px; }
.task { display:flex; justify-content:space-between; padding:10px; border-bottom:1px solid #ddd; }
.done { text-decoration: line-through; color:gray; }
</style>
</head>
<body>

<div class="container">
<h2>Task Manager</h2>

<form method="POST" action="add.php">
<input type="text" name="name" placeholder="Name" required><br><br>
<input type="text" name="designation" placeholder="Designation" required><br><br>
<input type="text" name="task" placeholder="Enter task..." required>
<button>Add Task</button>
</form>

<hr>

<?php
$result = $conn->query("SELECT * FROM tasks ORDER BY id DESC");

while($row = $result->fetch_assoc()) {
    echo "<div class='task'>
        <span>
        <b>{$row['name']}</b> ({$row['designation']})<br>
        {$row['task']}
        </span>
        <a href='delete.php?id={$row['id']}'>✖</a>
    </div>";
}
?>

</div>

</body>
</html>
