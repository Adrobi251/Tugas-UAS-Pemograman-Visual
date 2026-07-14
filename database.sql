-- Database Schema for Asistensi3 (Sistem Informasi Kursus Komputer)

CREATE DATABASE IF NOT EXISTS db_kursus;
USE db_kursus;

-- Table for Admin/Users Login
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'owner') NOT NULL DEFAULT 'admin'
);

-- Insert default admin and owner users
INSERT INTO users (username, password, role) VALUES ('admin', 'admin123', 'admin');
INSERT INTO users (username, password, role) VALUES ('owner', 'owner123', 'owner');

-- Table for Courses (Kursus)
CREATE TABLE IF NOT EXISTS kursus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kursus VARCHAR(100) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

-- Insert default courses
INSERT INTO kursus (nama_kursus, harga) VALUES ('Microsoft Office', 500000);
INSERT INTO kursus (nama_kursus, harga) VALUES ('Belajar Design', 750000);
INSERT INTO kursus (nama_kursus, harga) VALUES ('Belajar Coding', 1000000);

-- Table for Instructors (Instruktur)
CREATE TABLE IF NOT EXISTS instruktur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL,
    no_hp VARCHAR(20) NOT NULL,
    usia INT NOT NULL,
    kursus_id INT,
    alamat TEXT,
    FOREIGN KEY (kursus_id) REFERENCES kursus(id) ON DELETE SET NULL
);

-- Table for Participants/Registrants (Peserta/Pendaftaran)
CREATE TABLE IF NOT EXISTS peserta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL,
    no_hp VARCHAR(20) NOT NULL,
    kursus_id INT,
    alamat TEXT,
    tanggal_daftar TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (kursus_id) REFERENCES kursus(id) ON DELETE SET NULL
);

-- Table for Schedules (Jadwal)
CREATE TABLE IF NOT EXISTS jadwal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kursus_id INT NOT NULL,
    instruktur_id INT NOT NULL,
    hari VARCHAR(20) NOT NULL,
    jam VARCHAR(20) NOT NULL,
    ruangan VARCHAR(50) NOT NULL,
    FOREIGN KEY (kursus_id) REFERENCES kursus(id) ON DELETE CASCADE,
    FOREIGN KEY (instruktur_id) REFERENCES instruktur(id) ON DELETE CASCADE
);

-- Table for Payments (Pembayaran)
CREATE TABLE IF NOT EXISTS pembayaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    peserta_id INT NOT NULL,
    kursus_id INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    status ENUM('Lunas', 'Belum Lunas') DEFAULT 'Belum Lunas',
    tanggal_pembayaran TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (peserta_id) REFERENCES peserta(id) ON DELETE CASCADE,
    FOREIGN KEY (kursus_id) REFERENCES kursus(id) ON DELETE CASCADE
);
