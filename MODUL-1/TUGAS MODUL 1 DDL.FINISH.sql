DROP DATABASE IF EXISTS aplikasi_gojek;

-- Buat database
CREATE DATABASE aplikasi_gojek;
USE aplikasi_gojek;
SHOW DATABASES;


-- Tabel: Driver
CREATE TABLE Driver (
    NIK VARCHAR(20) PRIMARY KEY,
    Nama VARCHAR(100),
    TTL DATETIME,
    No_Hp VARCHAR(15),
    Email VARCHAR(100),
    Alamat VARCHAR(255)
);

-- Tabel: Pengguna
CREATE TABLE Pengguna (
    NIK VARCHAR(20) PRIMARY KEY,
    Nama VARCHAR(100),
    TTL DATETIME,
    No_Hp VARCHAR(15),
    Email VARCHAR(100),
    Alamat VARCHAR(255)
);

-- Tabel: Transportasi
CREATE TABLE Transportasi (
    Plat VARCHAR(20) PRIMARY KEY,
    Jenis_Kendaraan VARCHAR(50),
    Warna VARCHAR(30),
    Merk VARCHAR(50),
    Kapasitas INT,
    NIK_driver VARCHAR(20),
    FOREIGN KEY (NIK_driver) REFERENCES Driver(NIK) ON DELETE CASCADE
);

-- Tabel: Pembayaran
CREATE TABLE Pembayaran (
    ID_pembayaran VARCHAR(10) PRIMARY KEY,
    Metode VARCHAR(50),
    Total DECIMAL(10,2),
    Tanggal DATETIME,
    Status VARCHAR(20)
);

-- Tabel: Pemesan
CREATE TABLE Pemesan (
    ID_order VARCHAR(10) PRIMARY KEY,
    NIK_pengguna VARCHAR(20),
    Plat_transportasi VARCHAR(20),
    Tanggal_pesan DATETIME,
    Status_order VARCHAR(50),
    ID_pembayaran VARCHAR(10),
    FOREIGN KEY (NIK_pengguna) REFERENCES Pengguna(NIK) ON DELETE CASCADE,
    FOREIGN KEY (Plat_transportasi) REFERENCES Transportasi(Plat) ON DELETE CASCADE,
    FOREIGN KEY (ID_pembayaran) REFERENCES Pembayaran(ID_pembayaran) ON DELETE SET NULL
);

-- Tabel: Rating
CREATE TABLE Rating (
    ID_rating VARCHAR(10) PRIMARY KEY,
    ID_order VARCHAR(10),
    NIK_pengguna VARCHAR(20),
    NIK_driver VARCHAR(20),
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    FOREIGN KEY (ID_order) REFERENCES Pemesan(ID_order) ON DELETE CASCADE,
    FOREIGN KEY (NIK_pengguna) REFERENCES Pengguna(NIK) ON DELETE CASCADE,
    FOREIGN KEY (NIK_driver) REFERENCES Driver(NIK) ON DELETE CASCADE
);


-- Data Driver
INSERT INTO Driver VALUES
('DRV001', 'Agus Santoso', '1985-06-15', '081234567890', 'agus@example.com', 'Jakarta'),
('DRV002', 'Budi Hartono', '1990-02-20', '081298765432', 'budi@example.com', 'Bandung'),
('DRV003', 'Citra Lestari', '1988-10-10', '081212345678', 'citra@example.com', 'Surabaya'),
('DRV004', 'Agus Santosa', '1984-06-15', '081238763780', 'agus12@example.com', 'Sumatra'),
('DRV005', 'Budi Santoso', '1991-05-20', '085931765432', 'budi15@example.com', 'Bali'),
('DRV006', 'Indra Wijaya', '1983-09-25', '081345678901', 'indra@example.com', 'Makassar');


-- Data Pengguna
INSERT INTO Pengguna VALUES
('PNG001', 'Dewi Ayu', '1995-04-10', '089912345678', 'dewi@example.com', 'Jakarta'),
('PNG002', 'Eko Prasetyo', '1992-07-22', '089987654321', 'eko@example.com', 'Yogyakarta'),
('PNG003', 'Fajar Nugroho', '1990-01-05', '089998877665', 'fajar@example.com', 'Semarang'),
('096001', 'Rian', '1996-01-01', '081234567001', 'rian@example.com', 'Malang'),
('096002', 'Vina', '1996-02-01', '081234567002', 'vina@example.com', 'Denpasar');

-- Data Transportasi
INSERT INTO Transportasi VALUES
('B1234XYZ', 'Motor', 'Merah', 'Honda', 2, 'DRV001'),
('D5678ABC', 'Mobil', 'Hitam', 'Toyota', 4, 'DRV002'),
('L9101DEF', 'Motor', 'Putih', 'Yamaha', 5, 'DRV003'),
('AS6751TF', 'Mobil', 'Silver', 'Toyota', 4, 'DRV001'),
('GT9901XV', 'Motor', 'Hijau', 'Kawasaki', 2, 'DRV002');

-- Data Pembayaran
INSERT INTO Pembayaran VALUES
('PAY001', 'Gopay', 25000.00, '2024-04-01 08:30:01', 'Sukses'),
('PAY002', 'Tunai', 35000.00, '2024-04-02 09:00:02', 'Sukses'),
('PAY003', 'Dana', 15000.00, '2024-04-03 10:15:03', 'Sukses'),
('PAY004', 'Paylater', 50000.00, '2022-07-04 08:30:04', 'Sukses'),
('PAY005', 'Kredivo', 70000.00, '2021-03-05 09:00:05', 'Sukses'),
('PAY009', 'OVO', 50000.00, '2024-01-01 10:00:00', 'Sukses');

-- Data Pemesan
INSERT INTO Pemesan VALUES
('ORD001', 'PNG001', 'B1234XYZ', '2021-04-01', 'Sukses', 'PAY001'),
('ORD002', 'PNG002', 'D5678ABC', '2022-04-02', 'Selesai', 'PAY002'),
('ORD003', 'PNG003', 'L9101DEF', '2023-04-03', 'Selesai', 'PAY003'),
('ORD004', '096001', 'AS6751TF', '2020-01-02', 'Selesai', 'PAY009'),
('ORD005', '096002', 'GT9901XV', '2020-02-03', 'Selesai', 'PAY004');

-- Data Rating
INSERT INTO Rating VALUES
('RAT001', 'ORD001', 'PNG001', 'DRV001', 1),
('RAT002', 'ORD002', 'PNG002', 'DRV002', 2),
('RAT003', 'ORD003', 'PNG003', 'DRV003', 3),
('RAT004', 'ORD004', '096001', 'DRV001', 4),
('RAT005', 'ORD005', '096002', 'DRV002', 5);


-- Cek Semua Data
SELECT * FROM Driver;
SELECT * FROM Pengguna;
SELECT * FROM Transportasi;
SELECT * FROM Pembayaran;
SELECT * FROM Pemesan;
SELECT * FROM Rating;
