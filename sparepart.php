<?php include 'koneksi.php'; ?>
<h3>Data Sparepart</h3>
<a href="tambah_sparepart.php">Tambah</a>
<table border="1">
<tr>
<th>No Seri</th><th>Nama</th><th>Jumlah Stock Awal</th><th>Sisa Stock</th><th>Aksi</th>
</tr>

<?php
$q = mysqli_query($conn,"SELECT * FROM sparepart");
while($d=mysqli_fetch_array($q)){
?>
<tr>
<td><?= $d['nomor_seri'] ?></td>
<td><?= $d['nama_part'] ?></td>
<td><?= $d['jumlah_part'] ?></td>
<td><?= $d['sisa_part'] ?></td>
<td>
<a href="edit_sparepart.php?seri=<?= $d['nomor_seri'] ?>">Edit</a>
<?php if($d['sisa_part']==0){ ?>
| <a href="hapus_sparepart.php?seri=<?= $d['nomor_seri'] ?>">Hapus</a>
<?php } ?>
</td>
</tr>
<?php } ?>
</table>
<br>
<a href="dashboard_admin.php"><button>← Previous</button></a>