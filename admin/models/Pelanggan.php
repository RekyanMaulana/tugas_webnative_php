<?php
class Pelanggan {
 private $koneksi;
 public function __construct(){
    global $dbh; //instance object koneksi.php
    $this->koneksi = $dbh;
}   
 public function Pelanggan(){
    $sql = "SELECT pelanggan.*, kartu.nama as kartu FROM pelanggan INNER JOIN
    kartu ON kartu.id = pelanggan.kartu_id ";
    $ps = $this->koneksi->prepare($sql);
    $ps->execute();
    $rs = $ps->fetchAll();
    return $rs;
}

public function getPelanggan($id){
    $sql = "SELECT pelanggan.*, kartu.nama as kartu FROM pelanggan INNER JOIN
    kartu ON kartu.id = pelanggan.kartu_id WHERE pelanggan.id = ?";
    $ps = $this->koneksi->prepare($sql);
    $ps->execute([$id]);
    $rs = $ps->fetch();
    return $rs;
}

public function simpan($data){
    $sql = "INSERT INTO pelanggan(kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id)
    VALUES (?,?,?,?,?,?,?)";
    $ps = $this->koneksi->prepare($sql);
    $ps->execute($data);
}
}

?>