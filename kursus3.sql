

-- 1. HAPUS TABEL LAMA YANG BERUBAH
DROP TABLE IF EXISTS sertifikat;
DROP TABLE IF EXISTS pembayaran;
DROP TABLE IF EXISTS pendaftaran;
DROP TABLE IF EXISTS level_kursus;

-- 2. UBAH TABEL LOKASI (tambah kolom tipe)
ALTER TABLE lokasi ADD COLUMN tipe ENUM('offline','online') NOT NULL DEFAULT 'offline' AFTER nama_lokasi;
ALTER TABLE lokasi ADD COLUMN keterangan TEXT AFTER tipe;

-- Update data lokasi yang sudah ada
UPDATE lokasi SET tipe = 'offline', keterangan = 'Gedung 1 Lt. 1' WHERE id_lokasi = 1;
UPDATE lokasi SET tipe = 'offline', keterangan = 'Gedung 1 Lt. 2' WHERE id_lokasi = 2;
UPDATE lokasi SET tipe = 'online',  keterangan = 'Zoom/Google Meet' WHERE id_lokasi = 3;

-- 3. HAPUS KOLOM BIAYA DI KURSUS
ALTER TABLE kursus DROP COLUMN biaya;

-- 4. BUAT TABEL MEMBERSHIP (pengganti level_kursus)
CREATE TABLE membership (
  id_membership INT AUTO_INCREMENT PRIMARY KEY,
  nama_membership VARCHAR(50),
  benefit TEXT,
  durasi INT COMMENT 'durasi dalam hari'
);

INSERT INTO membership VALUES
(1, 'Bronze', 'Akses 1 kursus, sertifikat digital', 30),
(2, 'Silver', 'Akses 3 kursus, sertifikat digital + cetak', 90),
(3, 'Gold',   'Akses unlimited kursus, sertifikat cetak + bingkai', 180);

-- 5. BUAT TABEL SERTIFIKAT (master, dirujuk membership)
CREATE TABLE sertifikat_template (
  id_template INT AUTO_INCREMENT PRIMARY KEY,
  nama_template VARCHAR(100),
  deskripsi TEXT
);

INSERT INTO sertifikat_template VALUES
(1, 'Sertifikat Digital',        'Sertifikat dalam bentuk file PDF'),
(2, 'Sertifikat Cetak',          'Sertifikat dicetak di atas kertas'),
(3, 'Sertifikat Cetak + Bingkai','Sertifikat dicetak dan dibingkai');

-- 6. BUAT TABEL PENDAFTARAN (biaya pindah ke sini)
CREATE TABLE pendaftaran (
  id_pendaftaran INT AUTO_INCREMENT PRIMARY KEY,
  id_peserta     INT,
  id_kursus      INT,
  id_membership  INT,
  biaya          DECIMAL(10,2),
  tanggal_daftar DATE,
  STATUS         VARCHAR(20),
  FOREIGN KEY (id_peserta)    REFERENCES peserta(id_peserta),
  FOREIGN KEY (id_kursus)     REFERENCES kursus(id_kursus),
  FOREIGN KEY (id_membership) REFERENCES membership(id_membership)
);

INSERT INTO pendaftaran VALUES
(1,  1, 1, 1, 500000,  '2026-01-01', 'aktif'),
(2,  2, 2, 2, 450000,  '2026-01-02', 'aktif'),
(3,  3, 3, 3, 700000,  '2026-01-03', 'aktif'),
(4,  4, 4, 1, 650000,  '2026-01-04', 'selesai'),
(5,  5, 5, 2, 600000,  '2026-01-05', 'aktif'),
(6,  6, 6, 3, 800000,  '2026-01-06', 'aktif'),
(7,  7, 7, 1, 900000,  '2026-01-07', 'aktif'),
(8,  8, 8, 2, 1000000, '2026-01-08', 'aktif'),
(9,  9, 9, 3, 400000,  '2026-01-09', 'selesai'),
(10,10,10, 1, 1200000, '2026-01-10', 'aktif');

-- 7. BUAT TABEL PEMBAYARAN
CREATE TABLE pembayaran (
  id_pembayaran    INT AUTO_INCREMENT PRIMARY KEY,
  id_pendaftaran   INT,
  metode_pembayaran VARCHAR(50),
  tanggal_bayar    DATE,
  jumlah           DECIMAL(10,2),
  STATUS           VARCHAR(20),
  FOREIGN KEY (id_pendaftaran) REFERENCES pendaftaran(id_pendaftaran)
);

INSERT INTO pembayaran VALUES
(1,  1, 'Transfer Bank', '2026-01-01', 500000,  'lunas'),
(2,  2, 'E-Wallet',      '2026-01-02', 450000,  'lunas'),
(3,  3, 'Cash',          '2026-01-03', 700000,  'lunas'),
(4,  4, 'QRIS',          '2026-01-04', 650000,  'lunas'),
(5,  5, 'Transfer Bank', '2026-01-05', 600000,  'lunas'),
(6,  6, 'E-Wallet',      '2026-01-06', 800000,  'lunas'),
(7,  7, 'Cash',          '2026-01-07', 900000,  'lunas'),
(8,  8, 'QRIS',          '2026-01-08', 1000000, 'lunas'),
(9,  9, 'Transfer Bank', '2026-01-09', 400000,  'lunas'),
(10,10, 'E-Wallet',      '2026-01-10', 1200000, 'lunas');

-- 8. BUAT TABEL SERTIFIKAT (transaksi, hanya yang hadir di jadwal)
CREATE TABLE sertifikat (
  id_sertifikat    INT AUTO_INCREMENT PRIMARY KEY,
  id_jadwal        INT,
  nomor_sertifikat VARCHAR(100),
  tanggal_terbit   DATE,
  FOREIGN KEY (id_jadwal) REFERENCES jadwal_kursus(id_jadwal)
);

INSERT INTO sertifikat VALUES
(1,  1,  'CERT-001', '2026-02-01'),
(2,  2,  'CERT-002', '2026-02-01'),
(3,  3,  'CERT-003', '2026-02-01'),
(4,  4,  'CERT-004', '2026-02-01'),
(5,  5,  'CERT-005', '2026-02-01'),
(6,  6,  'CERT-006', '2026-02-01'),
(7,  7,  'CERT-007', '2026-02-01'),
(8,  8,  'CERT-008', '2026-02-01'),
(9,  9,  'CERT-009', '2026-02-01'),
(10,10,  'CERT-010', '2026-02-01');

-- Hapus foreign key dan kolom id_level dari kursus
ALTER TABLE kursus DROP FOREIGN KEY kursus_ibfk_3;
ALTER TABLE kursus DROP COLUMN id_level;

-- Hapus tabel level_kursus (sudah diganti membership)
DROP TABLE IF EXISTS level_kursus;