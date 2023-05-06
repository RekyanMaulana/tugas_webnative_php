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
}

?>