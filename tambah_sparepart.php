<?php include 'koneksi.php'; ?>
<form method="POST">
No Seri:<input name="seri"><br>
Nama Part:<input name="nama"><br>
Jumlah:<input type="number" name="jumlah"><br>
Tanggal:<input type="date" name="tanggal"><br>
<button name="simpan">Simpan</button>
</form>

<?php
if(isset($_POST['simpan'])){
    mysqli_query($conn,"INSERT INTO sparepart VALUES(
        '$_POST[seri]',
        '$_POST[nama]',
        '$_POST[jumlah]',
        '$_POST[jumlah]',
        '$_POST[tanggal]'
    )");
    header("Location: sparepart.php");}