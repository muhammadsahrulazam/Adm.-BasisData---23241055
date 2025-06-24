-- Nama : muhammad sahrul azam
-- nim  : 23241055
-- kelas: IV_B 
-- modul: 5

USE pti_mart;

-- JOIN = menggabungkan dua atau lebih tabel berdasarkan kolom yang sama
-- JOIN = relasi

-- praktek 1
-- mengambil nama kolom yang telah bertransaksi 
-- artinya ambil kolom kode_pelanggan, nama_pelanggan dan qty dari penggabungan tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan AS tp
JOIN ms_pelanggan AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- praktek 2
-- menggabungkan 2 tabel tanpa memperhatikan relational keys
-- ambil nam_pelanggan yang pernah bertransaksi beserta qty nya 
-- menggabungkan tabel penjualan dan tabel pelanggan tanpa memperhatikan kolom yang menjadi PK

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan AS tp
JOIN ms_pelanggan AS mp
ON TRUE;

-- inner join
-- yang mengambil data dari dua sisi table yang berhubungan
-- praktek 3
-- ambil koede_pelanggan, nama_pelanggan, nama_produk, dan qty
-- dari hasil join tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk, tp.qty
FROM tr_penjualan AS tp
INNER JOIN ms_pelanggan AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- latihan mandiri
-- 1. INNER JOIN ke-3 tabel  Buatlah join untuk ketiga table yang terdapat pada dqlabmartbasic dengan INNER JOIN
SELECT p.nama_pelanggan,pr.nama_produk,t.qty,t.harga,t.diskon_persen
FROM tr_penjualan AS t
INNER JOIN ms_pelanggan AS p ON t.kode_pelanggan = p.kode_pelanggan
INNER JOIN ms_produk AS pr ON t.kode_produk = pr.kode_produk;

-- 2. LEFT JOIN + IS NOT NULL Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan, dan ms_produk... filter untuk qty yang tidak bernilai NULL
SELECT p.nama_pelanggan,t.kode_transaksi,pr.nama_produk,t.qty
FROM ms_pelanggan AS p
LEFT JOIN tr_penjualan AS t ON p.kode_pelanggan = t.kode_pelanggan
LEFT JOIN ms_produk AS pr ON t.kode_produk = pr.kode_produk
WHERE t.qty IS NOT NULL;
    
 --  3. INNER JOIN + GROUP BY kategori produk + SUM qty INNER JOIN, kemudian tampilkan grouping untuk kolom kategori produk dan penjumlahan qty
 SELECT pr.kategori_produk,
SUM(t.qty) AS total_qty
FROM tr_penjualan AS t
INNER JOIN ms_produk AS pr ON t.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk;

 -- 4. Latihan Khusus – JOIN ms_produk dengan ms_produk JOIN ms_produk dengan dirinya sendiri lewat kode_produk, gunakan alias
 SELECT p1.kode_produk,
p1.nama_produk AS produk_asli,
p2.nama_produk AS produk_join
FROM ms_produk AS p1
JOIN ms_produk AS p2 ON p1.kode_produk = p2.kode_produk;
