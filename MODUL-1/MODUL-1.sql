-- Nama   : Muhammad Sahrul Azam
-- NIM    : 23241055
-- Kelas  : B

-- Menghapus database jika sudah ada
DROP DATABASE IF EXISTS mandalika_mart;

-- Membuat database
CREATE DATABASE mandalika_mart;
USE mandalika_mart;

-- Membuat tabel member
CREATE TABLE member (
    member_id VARCHAR(10) PRIMARY KEY,
    username VARCHAR(20),
    nama VARCHAR(100),
    tanggal_lahir DATETIME,
    angka_favorit INT
);

-- Membuat tabel produk
CREATE TABLE produk (
    id_produk VARCHAR(10) PRIMARY KEY,
    nama_produk VARCHAR(25),
    kategori VARCHAR(15),
    harga INT,
    qty INT
);

-- Membuat tabel transaksi_penjualan
CREATE TABLE transaksi_penjualan (
    tgl_jual DATETIME,
    id_produk VARCHAR(10),
    member_id VARCHAR(10),
    nama_produk VARCHAR(25),
    harga INT,
    qty INT,
    CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES member(member_id),
    CONSTRAINT fk_produk FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Mengisi data ke dalam tabel member
INSERT INTO member (member_id, username, nama, tanggal_lahir, angka_favorit)
VALUES ('ID-01', 'shrlazm', 'Sahrul', '2004-11-03', 7);

-- Menampilkan data dari tabel member
SELECT * FROM member;
