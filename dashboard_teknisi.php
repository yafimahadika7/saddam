<?php
session_start();
if(!isset($_SESSION['login']) || $_SESSION['role']!='teknisi'){
    header("Location: index.php");}?>

<h2>Dashboard Teknisi</h2>
<ul>
<li><a href="tambah_permintaan.php">Permintaan Sparepart</a></li>
<li><a href="permintaan.php">Lihat Permintaan</a></li>
<li><a href="logout.php">Logout</a></li>
</ul>