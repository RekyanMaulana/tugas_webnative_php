<?php
// include_once 'top.php';

// include_once 'menu.php';
$model = new JenisProduk();
$jenis_produk = $model->JenisProduk();

// foreach ($data_produk as $row){
//     print $row['kode'];
// }

?>
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <a href="index.php?url=jenis_produk_form" class="btn btn-primary btn-sm">Tambah</a>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Jenis Produk </th>
                                            <th>Keterangan</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No</th>
                                            <th>Jenis Produk</th>
                                            <th>Keterangan</th>   
                                            <th>Action</th>   
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php
                                        $no = 1;
                                        foreach($jenis_produk as $row){

                                        ?>
                                        <tr>
                                            <td><?= $no ?></td>
                                            <td><?= $row['nama']?></td>
                                            <td><?= $row['ket']?></td>
                                            <td>
                                                <form action="jenis_produk_controller.php" method="POST">
                                                    <a class="btn btn-info btn-sm" href="index.php?url=jenis_produk_detail&id=<?= $row ['id'] ?>">Detail</a>
                                                    <a class="btn btn-warning btn-sm">Ubah</a>
                                                    <a class="btn btn-danger btn-sm">Hapus</a>

                                                    <input type="hidden" name="idx" value="<?= $row ['id'] ?>">
                                                </form>
                                            </td>
                                        </tr>
                                      <?php
                                        $no++; 
                                    } 
                                        ?>
                                    </tbody>
                                </table>
                            </div>

</div>
</div>

                <?php
        // include_once 'bottom.php';
                ?>