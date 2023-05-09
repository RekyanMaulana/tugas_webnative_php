<?php
$id = $_REQUEST['id'];
$model = new Pelanggan();
$pelanggan = $model->getPelanggan($id);
?>

<div>
    <label>Kode : <?= $pelanggan['kode'] ?></label><br>
    <label>Nama Pelanggan : <?= $pelanggan['nama'] ?></label><br>
    <label>jenis Kelamin : <?= $pelanggan['jk'] ?></label><br>
    <label>Tempat Lahir : <?= $pelanggan['tmp_lahir'] ?></label><br>
    <label>Tanggal Lahir : <?= $pelanggan['tgl_lahir'] ?></label><br>
    <label>Email : <?= $pelanggan['email'] ?></label><br>
    <label>Jenis Kartu : <?= $pelanggan['kartu'] ?></label><br>
</div>