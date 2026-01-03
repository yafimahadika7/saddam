<?php
session_start();
include 'koneksi.php';

if(!isset($_SESSION['login']) || $_SESSION['role']!='teknisi'){
header("Location: login.php?role=teknisi");
exit;}

if(isset($_POST['kirim'])){
$id_teknisi = $_SESSION['id_teknisi'];
$nama_teknisi = $_SESSION['nama_teknisi'];
$nomor_seri = $_POST['nomor_seri'];
$nama_sparepart = $_POST['nama_sparepart'];
$jumlah_diminta = $_POST['jumlah'];
$lokasi = $_POST['lokasi'];
$tanggal = date('Y-m-d');

$cek = mysqli_query($conn,"SELECT sisa_part FROM sparepart WHERE nomor_seri='$nomor_seri'");
$data = mysqli_fetch_assoc($cek);

if(!$data){
echo "<script>alert('Nomor seri sparepart salah!');</script>";} elseif($data['sisa_part'] < $jumlah_diminta){
echo "<script>alert('Stok sparepart tidak cukup! Stok tersedia: ".$data['sisa_part']."');</script>";
} else {
$sql = "INSERT INTO permintaan 
(id_teknisi, nama_teknisi, nomor_seri, nama_sparepart, jumlah_diminta, lokasi_atm, tanggal)VALUES 
('$id_teknisi', '$nama_teknisi', '$nomor_seri', '$nama_sparepart', '$jumlah_diminta', '$lokasi', '$tanggal')";
        
if(mysqli_query($conn, $sql)){
$stok_baru = $data['sisa_part'] - $jumlah_diminta;
mysqli_query($conn,"UPDATE sparepart SET sisa_part='$stok_baru' WHERE nomor_seri='$nomor_seri'");

echo "<script>alert('Permintaan berhasil disimpan. Stok sparepart telah diperbarui.');window.location='permintaan.php';</script>";} else {
echo "Error: " . mysqli_error($conn);}}}?>

<h2>Buat Permintaan Sparepart</h2>
<form method="POST">
Nomor Seri: <input name="nomor_seri" required><br>
Nama Sparepart: <input name="nama_sparepart" required><br>
Jumlah: <input type="number" name="jumlah" min="1" required><br>
Lokasi ATM: <input name="lokasi" required><br>
<button type="submit" name="kirim">Kirim</button>
</form>
<br>
<a href="dashboard_teknisi.php"><button>← Previous</button></a>