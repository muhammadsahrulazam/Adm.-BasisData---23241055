-- Nama  : Muhammad sahrul azam
-- Nim   : 23241055
-- Kelas : IV B
-- Modul : 2 (SELECT)

-- Membuat database
CREATE DATABASE PTI_Mart;

-- menjalankan databasse
USE PTI_Mart;

-- menampilkan schema
SHOW DATABASES;

-- cek kolom dalam setiap tabel
DESCRIBE ms_pelanggan;
DESCRIBE ms_produk;
DESCRIBE tr_penjualan;

-- SELECT
-- menggunakan SELECT untuk 1 tabel
-- mengambil kolom nama produk dari tabel produk
SELECT nama_produk FROM ms_produk;

-- mengambil lebih dari 1 kolom dari sebuah
SELECT nama_produk, harga, kategori_produk FROM ms_produk;

-- mengambil semua kolom dari sebuah tabel/ menampilkan data dari sebuah tabel
SELECT * FROM ms_produk;
SELECT * FROM ms_pelanggan;
SELECT * FROM tr_penjualan;

-- latihan
-- mengambil kode produk dan nama produk dari tabel produk
SELECT kode_produk, nama_produk FROM ms_produk;

-- mengambil seluruh kolom dari penjualan
SELECT * FROM tr_penjualan;

-- PREFIX DAN ALIAS

-- PREFIX 
-- PREFIX adalah bagian objek database yang hirarkiny tinggi
-- contoh prefix
SELECT ms_produk.nama_produk FROM ms_produk;

-- menggunakan nama database dan tabel sebagai PREFIX untuk kolom nama_produk
SELECT PTI_mart.ms_produk.nama_produk FROM ms_produk;

-- ALIAS 
-- ALIAS adalah pengganti nama objek / ALIAS itu nama sementara
-- mengganti nama sementara dari kolom nama_produk dengan ALIAS
SELECT nama_produk AS np FROM ms_produk;
SELECT nama_produk np FROM ms_produk;

-- mengganti sementara tabel dengan ALIAS
SELECT nama_produk FROM ms_produk AS msp;

-- kombinasikan PREFIX dan ALIAS
SELECT msp.nama_produk FROM ms_produk AS msp;

-- CASE 1
SELECT nama_pelanggan,alamat FROM ms_pelanggan;

-- CASE 2
SELECT nama_produk,harga FROM ms_produk;



