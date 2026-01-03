<?php
session_start();
include 'koneksi.php';

if($_SESSION['role']!='admin'){
header("Location: index.php");}?>

<h2>Tambah Teknisi</h2>
<form method="POST">
Username Teknisi:<br>
<input type="text" name="username" required><br><br>
Password:<br>
<input type="password" name="password" required><br><br>
<button name="simpan">Simpan</button>
</form>

<?php
if(isset($_POST['simpan'])){
mysqli_query($conn,"INSERT INTO user VALUES(
NULL,
'$_POST[username]',
'$_POST[password]',
'teknisi')");

echo "<script>
alert('Teknisi berhasil ditambahkan');
window.location='teknisi.php';
</script>";}?>
<br>
<a href="teknisi.php">← Kembali</a>