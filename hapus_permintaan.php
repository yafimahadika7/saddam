<?php
session_start();
include 'koneksi.php';

if(!isset($_SESSION['login']) || $_SESSION['role'] != 'admin'){
    header("Location: login.php?role=admin");
    exit;}
$id = $_GET['id'];

mysqli_query($conn,"DELETE FROM permintaan WHERE id='$id'");
header("Location: permintaan.php");?>