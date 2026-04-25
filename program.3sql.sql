-- =========================
-- DATABASE
-- =========================
CREATE DATABASE IF NOT EXISTS db_pertemuan4;
USE db_pertemuan4;

-- =========================
-- LATIHAN 1
-- Procedure cek_status_stok
-- =========================
DROP PROCEDURE IF EXISTS cek_status_stok;
DELIMITER $$

CREATE PROCEDURE cek_status_stok(IN p_stok INT)
BEGIN
    DECLARE v_status VARCHAR(50);

    IF p_stok = 0 THEN
        SET v_status = 'Habis';
    ELSEIF p_stok BETWEEN 1 AND 5 THEN
        SET v_status = 'Hampir Habis';
    ELSEIF p_stok BETWEEN 6 AND 20 THEN
        SET v_status = 'Tersedia';
    ELSE
        SET v_status = 'Stok Aman';
    END IF;

    SELECT CONCAT('Status: ', v_status) AS hasil;
END $$

DELIMITER ;

-- =========================
-- PENGUJIAN LATIHAN 1
-- =========================
CALL cek_status_stok(0);
CALL cek_status_stok(3);
CALL cek_status_stok(10);
CALL cek_status_stok(30);


-- =========================
-- LATIHAN 2
-- Tabel Produk + CASE
-- =========================
DROP TABLE IF EXISTS produk;

CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100),
    stok INT
);

INSERT INTO produk (nama_produk, stok) VALUES
('Laptop', 25),
('Mouse', 4),
('Keyboard', 10),
('Flashdisk', 0),
('Monitor', 7);

-- =========================
-- PENGUJIAN LATIHAN 2
-- =========================
SELECT 
    id_produk,
    nama_produk,
    stok,
    CASE
        WHEN stok = 0 THEN 'Habis'
        WHEN stok BETWEEN 1 AND 5 THEN 'Hampir Habis'
        WHEN stok BETWEEN 6 AND 20 THEN 'Tersedia'
        ELSE 'Stok Aman'
    END AS status_stok
FROM produk;


-- =========================
-- LATIHAN 3
-- Procedure hitung_diskon
-- =========================
DROP PROCEDURE IF EXISTS hitung_diskon;
DELIMITER $$

CREATE PROCEDURE hitung_diskon(IN p_total_belanja DECIMAL(12,2))
BEGIN
    DECLARE v_diskon_persen INT;
    DECLARE v_jumlah_diskon DECIMAL(12,2);
    DECLARE v_total_bayar DECIMAL(12,2);

    IF p_total_belanja >= 1000000 THEN
        SET v_diskon_persen = 15;
    ELSEIF p_total_belanja >= 500000 THEN
        SET v_diskon_persen = 10;
    ELSEIF p_total_belanja >= 250000 THEN
        SET v_diskon_persen = 5;
    ELSE
        SET v_diskon_persen = 0;
    END IF;

    SET v_jumlah_diskon = (v_diskon_persen / 100) * p_total_belanja;
    SET v_total_bayar = p_total_belanja - v_jumlah_diskon;

    SELECT 
        p_total_belanja AS total_belanja,
        CONCAT(v_diskon_persen, '%') AS diskon,
        v_jumlah_diskon AS jumlah_diskon,
        v_total_bayar AS total_bayar;
END $$

DELIMITER ;

-- =========================
-- PENGUJIAN LATIHAN 3
-- =========================
CALL hitung_diskon(200000);
CALL hitung_diskon(300000);
CALL hitung_diskon(700000);
CALL hitung_diskon(1200000);


-- =========================
-- KUIS
-- Procedure cek_predikat_mahasiswa
-- =========================
DROP PROCEDURE IF EXISTS cek_predikat_mahasiswa;
DELIMITER $$

CREATE PROCEDURE cek_predikat_mahasiswa(IN p_nilai INT)
BEGIN
    DECLARE v_predikat VARCHAR(50);
    DECLARE v_status VARCHAR(20);

    IF p_nilai >= 90 THEN
        SET v_predikat = 'Sangat Memuaskan';
    ELSEIF p_nilai >= 80 THEN
        SET v_predikat = 'Memuaskan';
    ELSEIF p_nilai >= 70 THEN
        SET v_predikat = 'Baik';
    ELSEIF p_nilai >= 60 THEN
        SET v_predikat = 'Cukup';
    ELSE
        SET v_predikat = 'Kurang';
    END IF;

    IF p_nilai >= 70 THEN
        SET v_status = 'Lulus';
    ELSE
        SET v_status = 'Tidak Lulus';
    END IF;

    SELECT 
        p_nilai AS nilai,
        v_predikat AS predikat,
        v_status AS status_kelulusan;
END $$

DELIMITER ;

-- =========================
-- PENGUJIAN KUIS
-- =========================
CALL cek_predikat_mahasiswa(95);
CALL cek_predikat_mahasiswa(82);
CALL cek_predikat_mahasiswa(70);
CALL cek_predikat_mahasiswa(50);