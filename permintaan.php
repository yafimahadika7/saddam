<?php
session_start();
include 'koneksi.php';

if(!isset($_SESSION['login'])){
    header("Location: login.php");
    exit;}

if($_SESSION['role'] == 'admin') {
    // Admin melihat semua data
    $q = mysqli_query($conn, "SELECT * FROM permintaan ORDER BY tanggal DESC");
} else if($_SESSION['role'] == 'teknisi') {
    // Teknisi hanya melihat data miliknya
    $nama_teknisi = $_SESSION['nama_teknisi']; // pastikan username di session sama dengan nama_teknisi
    $stmt = $conn->prepare("SELECT * FROM permintaan WHERE nama_teknisi = ? ORDER BY tanggal DESC");
    $stmt->bind_param("s", $nama_teknisi);
    $stmt->execute();
    $q = $stmt->get_result();
}
?>

<h2>Data Permintaan Sparepart</h2>
<table border="1" cellpadding="5">
<tr>
<th>ID</th><th>Nama Teknisi</th><th>Nomor Seri</th><th>Nama Sparepart</th><th>Jumlah</th><th>Lokasi</th><th>Tanggal</th>
<?php if($_SESSION['role']=='admin'){ ?>
<th>Aksi</th>
<?php } ?>
</tr>

<?php while($d = mysqli_fetch_assoc($q)){ ?>
<tr>
<td><?= $d['id'] ?></td>
<td><?= $d['nama_teknisi'] ?></td>
<td><?= $d['nomor_seri'] ?></td>
<td><?= $d['nama_sparepart'] ?></td>
<td><?= $d['jumlah_diminta'] ?></td>
<td><?= $d['lokasi_atm'] ?></td>
<td><?= $d['tanggal'] ?></td>
<?php if($_SESSION['role']=='admin'){ ?>
<td>
<a href="hapus_permintaan.php?id=<?= $d['id'] ?>" onclick="return confirm('Hapus permintaan ini?')">Hapus</a>
</td>
<?php } ?>
</tr>
<?php } ?>
</table>

<?php if($_SESSION['role']=='admin'){ ?>
<a href="dashboard_admin.php">
<button type="button">← Kembali</button>
<?php }?>
<?php if($_SESSION['role']=='teknisi'){ ?>
<a href="dashboard_teknisi.php"><button type="button">← Kembali</button>
<?php }?>