<?php
$conn = mysqli_connect("localhost","root","","atm_sparepart");
if(!$conn){
    die("Koneksi database gagal");}