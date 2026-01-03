<?php
session_start();
include 'koneksi.php';

if($_SESSION['role']!='admin'){
header("Location: index.php");}?>

<h2>Daftar Teknisi ATM</h2>

<a href="tambah_teknisi.php">+ Tambah Teknisi</a>
<br><br>
<table border="1" cellpadding="5">
<tr>
<th>ID</th>
<th>Username</th>
<th>Aksi</th>
</tr>

<?php
$q = mysqli_query($conn,"SELECT * FROM user WHERE role='teknisi'");
while($d = mysqli_fetch_array($q)){?>
<tr>
<td><?= $d['id'] ?></td>
<td><?= $d['username'] ?></td>
<td>
<a href="hapus_teknisi.php?id=<?= $d['id'] ?>"
onclick="return confirm('Hapus teknisi?')">
Hapus
</a>
</td>
</tr>
<?php } ?>
</table>
<br>
<a href="dashboard_admin.php"><button>← Kembali ke Dashboard</button></a>