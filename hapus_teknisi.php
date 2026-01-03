<?php
session_start();
include 'koneksi.php';

if($_SESSION['role']!='admin'){
    header("Location: index.php");}

$id = $_GET['id'];
mysqli_query($conn,"DELETE FROM user WHERE id='$id' AND role='teknisi'");
header("Location: teknisi.php");