<?php
session_start();
if(!isset($_SESSION['login']) || $_SESSION['role']!='admin'){
    header("Location: index.php");}?>

<h2>Dashboard Admin</h2>
<ul>
<li><a href="sparepart.php">Kelola Sparepart</a></li>
<li><a href="teknisi.php">Daftar Teknisi</a></li>
<li><a href="permintaan.php">Data Permintaan</a></li>
<li><a href="logout.php">Logout</a></li>
</ul>