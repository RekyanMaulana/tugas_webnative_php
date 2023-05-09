<?php
$id = $_REQUEST['id'];
$model = new JenisProduk();
$jenis_produk = $model->getJenisProduk($id);
?>

<div>
    <label>Jenis Produk : <?= $jenis_produk['nama'] ?></label><br>
    <label>Keterangan : <?= $jenis_produk['ket'] ?></label><br>
</div>