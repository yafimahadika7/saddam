<?php
session_start();
include 'koneksi.php';

$username = $_POST['username'];
$password = $_POST['password'];
$role     = $_POST['role'];

$query = mysqli_query($conn,"SELECT * FROM user 
WHERE username='$username' 
AND password='$password' 
AND role='$role'");
$data = mysqli_fetch_assoc($query);

if($data){
$_SESSION['login'] = true;
$_SESSION['role']  = $role;
$_SESSION['id_teknisi'] = $data['id'];       // SIMPAN ID
$_SESSION['nama_teknisi'] = $data['username'];  // SIMPAN NAMA

if($role=='admin'){
header("Location: dashboard_admin.php");}else{
header("Location: dashboard_teknisi.php");}}else{
echo "<script>
alert('Login gagal! Username / Password / Role salah');
window.location='login.php?role=$role';
</script>";}?>