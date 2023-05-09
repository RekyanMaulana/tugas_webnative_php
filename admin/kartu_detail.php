<?php
$id = $_REQUEST['id'];
$model = new Kartu();
$kartu = $model->getKartu($id);
?>

<div>
    <label>Kode : <?= $kartu['kode'] ?></label><br>
    <label>Nama Kartu : <?= $kartu['nama'] ?></label><br>
    <label>Diskon : <?= $kartu['diskon'] ?></label><br>
    <label>Iuran : <?= $kartu['iuran'] ?></label><br>
</div>