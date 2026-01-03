CREATE DATABASE atm_sparepart;
USE atm_sparepart;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    role ENUM('admin','teknisi'));
    
INSERT INTO user VALUES
(NULL,'admin','admin123','admin'),
(NULL,'teknisi','teknisi123','teknisi');

CREATE TABLE sparepart (
    nomor_seri VARCHAR(50) PRIMARY KEY,
    nama_part VARCHAR(100),
    jumlah_part INT,
    sisa_part INT,
    tanggal_pengadaan DATE);

CREATE TABLE permintaan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_teknisi VARCHAR(100),
    nomor_seri VARCHAR(50),
    nama_sparepart VARCHAR(100),
    jumlah_diminta INT,
    lokasi_atm VARCHAR(100),
    tanggal DATE);