<?php
class JenisProduk {
    private $koneksi;
    public function __construct(){
        global $dbh;
        $this->koneksi = $dbh;
    }
    public function JenisProduk(){
        $sql = "SELECT * FROM jenis_produk";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
    }
    public function getJenisProduk($id){
        $sql = "SELECT * FROM jenis_produk WHERE jenis_produk.id = ?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
        $rs = $ps->fetch();
        return $rs;
    }
    
    public function simpan($data){
        $sql = "INSERT INTO jenis_produk(nama, ket)
        VALUES (?,?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }
}


?>