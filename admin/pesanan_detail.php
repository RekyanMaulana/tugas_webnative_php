<?php
$id = $_REQUEST['id'];
$model = new Pesanan();
$pesanan = $model->getPesanan($id);
?>

<div>
    <label>Tanggal Pesanan : <?= $pesanan['tanggal'] ?></label><br>
    <label>Total Pesanan : <?= $pesanan['total'] ?></label><br>
    <label>Nama Pelanggan : <?= $pesanan['nama'] ?></label><br>
</div>