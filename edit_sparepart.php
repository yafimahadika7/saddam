<?php
include 'koneksi.php';
$seri=$_GET['seri'];
$d=mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM sparepart WHERE nomor_seri='$seri'"));
?>

<form method="POST">
Nama:<input name="nama" value="<?= $d['nama_part'] ?>"><br>
Jumlah:<input type="number" name="jumlah" value="<?= $d['jumlah_part'] ?>"><br>
Sisa:<input type="number" name="sisa" value="<?= $d['sisa_part'] ?>"><br>
<button name="update">Update</button>
</form>
<br>
<a href="sparepart.php"><button>← Previous</button></a>

<?php
if(isset($_POST['update'])){
    mysqli_query($conn,"UPDATE sparepart SET
        nama_part='$_POST[nama]',
        jumlah_part='$_POST[jumlah]',
        sisa_part='$_POST[sisa]'
        WHERE nomor_seri='$seri'");
    header("Location: sparepart.php");}