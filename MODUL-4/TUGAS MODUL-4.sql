-- Nama  : Muhammad sahrul azam
-- kelas : IV B
-- Nim   : 23241055
-- Modul : ORDER BY,FUNGSI AGREGASI, GROUP BY, HAVING

USE pti_mart;

-- ORDER BY
-- Ambil nama produk dari tabel penjualan urutkan qty
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty;

-- ambil nama produk dari qty dari tb penjualan urutkan qty dan nama produk (a-z)
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- latihan 1
-- tampilkan semua kolom dari tabel tr_penjualan dengan mengurutkan qty dan tgl_transaksi 1,2,3....
SELECT * FROM tr_penjualan ORDER BY qty, tgl_transaksi;

-- tampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan nama pelanggan dengan awalan huruf A ke Z
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;

-- tampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan alamat dengan awalan huruf A ke Z
SELECT * FROM ms_pelanggan ORDER BY alamat;

-- ORDER BY ASC  dan DESC
-- ambil nama produk, qty dari tb penjualan urutkan berdasarkan qty besar ke kecil 9,8,7...
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- ambil nama produk, qty dari tb penjualan urutkan berdasarkan qty besar ke kecil (huruf z,y,x...) dan (5.4.3...)
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- latihan 2
-- tampilkan semua kolom dari tabel tr_penjualan dengan mengurutkan qty secara ASC dan tgl_transaksi secara DESC 
SELECT * FROM tr_penjualan ORDER BY qty ASC, tgl_transaksi DESC;

-- menampilkan semua kolom ms pelanggan dengan mengurutkan nama dari besar ke kecil (Z ke A)
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;

-- menampilkan semua kolom ms pelanggan dengan mengurutkan alamat dari huruf besar  ke kecil (Z ke A)
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;

-- ORDER BY dari hasil perhitungan
-- ambil nama produk, qty, harga, untuk menghitung total harga perproduk dengan harga di kali qty 
-- dan memberikan nama sementara dari harga di kali qty menjadi total dan mengurutkannanya dari besar ke kecil
SELECT nama_produk, harga, qty, harga*qty as total
FROM tr_penjualan
ORDER BY total DESC;

-- latihan 3
-- Ambil data produk, harga, jumlah, dan diskon persen kemudian menghitung harga di kali qty 
-- dengan mengganti nama menjadi total harga dan total_harga dikurangi diskon (diskon_persen % dari total_harga)
-- mengganti nama menjadi total bayar kemudian mengurutkan total bayar dari yang besar ke kecil 
SELECT nama_produk, harga, qty, diskon_persen, 
(harga * qty) AS total_harga, (harga * qty) - ((diskon_persen / 100) * (harga * qty)) AS total_bayar
FROM tr_penjualan
ORDER BY total_bayar DESC;


--  Menyaring hanya baris data yang memiliki diskon lebih dari 0%
SELECT nama_produk, harga, qty, diskon_persen, 
(harga * qty) AS total_harga, (harga * qty) - ((diskon_persen / 100) * (harga * qty)) AS total_bayar
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY total_bayar DESC;

-- ORDER BY menggunakan WHERE
-- ambil nama produk, qty,  dari tb penjualan dan menyaring yang nama produknya berawalan f urut qty (besar ke kecil)
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'F%'
ORDER BY qty DESC;

-- latihan 4
-- untuk mengambil semua kolom dari tabel tr penjualan 
-- dan menyaring nilai diskon lebih dari nol dan mengurutkan nilai harga dari besar ke kecil
SELECT *
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY harga DESC;

-- mengambil kolom nama produk, qty, dan harga dari tr penjualan dengan menyaring nilai harga 
-- dari 100000 atau lebih dan mengurutkannya dari besar ke kecil
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- mengambil kolom nama produk, qty dan harga dari kolom tr penjualan dan menyaring harga dari 100000 atau lebih 
-- dan nama produk yang berawalan dari T, terus mengurutkan namanya dari besar ke kecil
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;






