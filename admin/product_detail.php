<?php
$id = $_REQUEST['id'];
$model = new Produk();
$produk = $model->getProduk($id);
?>

<div>
    <label>Kode : <?= $produk['kode'] ?></label><br>
    <label>Nama Produk : <?= $produk['nama'] ?></label><br>
    <label>Harga Beli : <?= $produk['harga_beli'] ?></label><br>
    <label>Harga Jual : <?= $produk['harga_jual'] ?></label><br>
    <label>Stok : <?= $produk['stok'] ?></label><br>
    <label>Minimal Stok : <?= $produk['min_stok'] ?></label><br>
    <label>Kategori Produk : <?= $produk['kategori'] ?></label><br>
</div>