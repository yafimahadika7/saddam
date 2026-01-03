<?php
include 'koneksi.php';
mysqli_query($conn,"DELETE FROM sparepart WHERE nomor_seri='$_GET[seri]'");
header("Location: sparepart.php");