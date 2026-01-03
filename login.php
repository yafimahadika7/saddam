<?php
$role = $_GET['role'] ?? '';
if($role != 'admin' && $role != 'teknisi'){
    header("Location: index.php");}?>

<h3>Login <?= ucfirst($role) ?></h3>
<form method="POST" action="proses_login.php">
<input type="hidden" name="role" value="<?= $role ?>">
Username:<br>
<input type="text" name="username" required><br><br>
Password:<br>
<input type="password" name="password" required><br><br>
<button type="submit">Login</button>
<br>
<a href="index.php"><button type="button">← Previous</button></a>
</form>