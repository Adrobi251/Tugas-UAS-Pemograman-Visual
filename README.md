# Tugas-UAS-Pemograman-Visual

# Manual Book - Petunjuk Pengguna Aplikasi Sistem Informasi Kursus Komputer

## 1. Pendahuluan

Aplikasi Sistem Informasi Kursus Komputer adalah aplikasi desktop berbasis Java Swing yang dirancang untuk mengelola operasional sebuah lembaga kursus komputer. Aplikasi ini mencakup pengelolaan data peserta, instruktur, kursus, jadwal, pendaftaran, dan pembayaran.

Aplikasi ini memiliki 2 (dua) level akses pengguna:
- **ADMIN** : Mengelola data operasional (CRUD - Create, Read, Update, Delete)
- **OWNER** : Melihat laporan dan ringkasan data (Read-Only / Laporan)

## 2. Persyaratan Sistem

**Perangkat Lunak (Software):**
- Java Development Kit (JDK) 8 atau lebih baru
- Apache NetBeans IDE (direkomendasikan versi 12+)
- XAMPP / MySQL Server (untuk database)
- MySQL Connector/J (driver JDBC)

**Perangkat Keras (Hardware) Minimum:**
- Prosesor : Intel Core i3 atau setara
- RAM : 4 GB
- Penyimpanan : 500 MB ruang kosong
- Layar : Resolusi minimum 1024 x 768

## 3. Instalasi & Konfigurasi Database

**Langkah 1 - Jalankan MySQL Server**

Buka XAMPP Control Panel, kemudian klik tombol "Start" pada module MySQL.

**Langkah 2 - Buat Database**

Buka phpMyAdmin (http://localhost/phpmyadmin) atau MySQL CLI, lalu jalankan perintah SQL yang terdapat di file `database.sql` pada folder project ini.

Cara melalui phpMyAdmin:
1. Klik tab "Import"
2. Pilih file `database.sql` dari folder project
3. Klik tombol "Go" / "Eksekusi"

Cara melalui command line:
```
mysql -u root -p < database.sql
```

**Langkah 3 - Verifikasi Konfigurasi Koneksi**

Pastikan pengaturan koneksi database sesuai dengan file `Koneksi.java`:
- URL : `jdbc:mysql://localhost:3306/db_kursus`
- Username : `root`
- Password : (kosong / tanpa password)

Jika MySQL Anda menggunakan password, ubah variabel `pass` di file `src/uas/Koneksi.java` sesuai password MySQL Anda.

## 4. Menjalankan Aplikasi

**Melalui NetBeans IDE:**
1. Buka NetBeans IDE
2. Pilih File > Open Project
3. Arahkan ke folder project "boasganteng"
4. Klik "Open Project"
5. Klik kanan project > "Run" atau tekan tombol F6
6. Aplikasi akan terbuka dengan halaman Login

**Melalui File JAR (jika sudah di-build):**
1. Buka folder `dist` pada project
2. Double-click file `.jar`, atau
3. Jalankan melalui command line:
```
java -jar dist/boasganteng.jar
```

## 5. Halaman Login

Halaman login adalah tampilan pertama saat aplikasi dijalankan.

```
+------------------------------------------+
|   Sistem Informasi Kursus Komputer       |
|              [Icon]                       |
|                                          |
|   ID/Username : [__________________]     |
|   Password    : [__________________]     |
|                                          |
|              [ Login ]                   |
+------------------------------------------+
```

**Petunjuk:**
1. Masukkan Username pada field "ID/Username"
2. Masukkan Password pada field "Password"
3. Klik tombol "Login"
4. Jika berhasil, akan muncul pesan "Login Berhasil!" dan aplikasi akan mengarahkan ke halaman sesuai role:
   - Role "admin" -> Dashboard Admin
   - Role "owner" -> Dashboard Owner
5. Jika username/password salah, akan muncul pesan error

## 6. Panel Admin (Dashboard)

Setelah login sebagai Admin, Anda akan masuk ke halaman Dashboard Admin. Di sisi kiri terdapat sidebar navigasi dengan menu-menu berikut:

```
[Icon] KURSUS KOMPUTER
---------------------------
| Dashboard               |
| Data Peserta            |
| Data Instruktur         |
| Data Kursus             |
| Jadwal Kursus           |
| Pendaftaran             |
| Pembayaran              |
|                         |
|       [Logout]          |
---------------------------
```

### 6.1 Dashboard Utama

Menampilkan ringkasan informasi sistem berupa:
- Total Peserta : Jumlah seluruh peserta yang terdaftar
- Total Pendapatan : Jumlah total pembayaran yang sudah lunas
- Total Instruktur : Jumlah instruktur yang terdaftar
- Pendaftaran Hari Ini : Jumlah peserta yang mendaftar hari ini
- Tabel 10 pendaftaran terbaru

### 6.2 Data Peserta

Menampilkan daftar seluruh data peserta dalam bentuk tabel.

**Fitur yang tersedia:**

**a. Tambah Peserta**
- Klik tombol "Tambah Peserta"
- Isi form: Nama, Jenis Kelamin, No HP, Kursus, Alamat
- Klik "Simpan" untuk menyimpan data
- Klik "Reset" untuk mengosongkan form

**b. Cari Peserta**
- Ketik kata kunci pada field pencarian
- Klik tombol "Cari"
- Tabel akan menampilkan hasil pencarian

### 6.3 Data Instruktur

Menampilkan daftar seluruh data instruktur.

**Fitur yang tersedia:**

**a. Tambah Instruktur**
- Klik tombol "Tambah Instruktur"
- Isi form: Nama, Jenis Kelamin, No HP, Usia, Kursus, Alamat
- Klik "Simpan" untuk menyimpan data
- Klik "Reset" untuk mengosongkan form

**b. Cari Instruktur**
- Ketik kata kunci pada field pencarian
- Klik tombol "Cari"

### 6.4 Data Kursus

Menampilkan daftar seluruh kursus yang tersedia beserta harganya.

**Fitur yang tersedia:**

**a. Tambah Kursus**
- Klik tombol "Tambah Kursus"
- Isi form:
  - **Nama Kursus** : Nama kursus yang akan ditambahkan (contoh: "Web Programming", "Data Science")
  - **Harga** : Harga kursus dalam Rupiah (masukkan angka saja, contoh: 500000)
- Klik "Simpan" untuk menyimpan data kursus baru
- Klik "Reset" untuk mengosongkan semua field

**Validasi:**
- Semua field wajib diisi
- Field "Harga" harus berupa angka
- Jika berhasil, akan muncul pesan "Data Kursus Berhasil Disimpan!" dan otomatis kembali ke halaman daftar kursus

**b. Cari Kursus**
- Ketik nama kursus pada field pencarian
- Klik tombol "Cari"
- Tabel akan menampilkan kursus yang sesuai

### 6.5 Jadwal Kursus

Menampilkan daftar jadwal kursus yang sudah diatur.

**Fitur yang tersedia:**

**a. Tambah Jadwal**
- Klik tombol "Tambah Jadwal"
- Isi form: Kursus, Instruktur, Hari, Jam, Ruangan
- Klik "Simpan" untuk menyimpan jadwal baru

**b. Cari Jadwal**
- Ketik kata kunci pada field pencarian
- Klik tombol "Cari"

### 6.6 Pendaftaran

Menampilkan daftar seluruh pendaftaran peserta.

**Fitur yang tersedia:**

**a. Tambah Pendaftaran**
- Klik tombol "Tambah Pendaftaran"
- Isi form: Nama, Jenis Kelamin, No HP, Kursus, Alamat
- Klik "Simpan" untuk menyimpan pendaftaran baru

**b. Cari Pendaftaran**
- Ketik kata kunci pada field pencarian
- Klik tombol "Cari"

### 6.7 Pembayaran

Menampilkan daftar seluruh transaksi pembayaran.

**Fitur yang tersedia:**

**a. Tambah Pembayaran**
- Klik tombol "Tambah Pembayaran"
- Isi form: Peserta, Kursus, Total Bayar, Status (Lunas/Belum Lunas)
- Klik "Simpan" untuk menyimpan transaksi

**b. Cari Pembayaran**
- Ketik kata kunci pada field pencarian
- Klik tombol "Cari"

### 6.8 Logout

- Klik tombol "Logout" di bagian bawah sidebar
- Aplikasi akan kembali ke halaman Login
- Dashboard Admin akan ditutup

## 7. Panel Owner

Setelah login sebagai Owner, Anda akan masuk ke halaman Dashboard Owner. Panel Owner bersifat read-only (hanya melihat laporan, tidak bisa CRUD).

```
[Icon] KURSUS KOMPUTER
---------------------------
| Dashboard               |
| Laporan Peserta         |
| Laporan Instruktur      |
| Laporan Kursus          |
| Laporan Pendaftaran     |
| Laporan Pembayaran      |
|                         |
|       [Logout]          |
---------------------------
```

### 7.1 Dashboard Owner

Menampilkan ringkasan informasi yang sama dengan Dashboard Admin:
- Total Peserta
- Total Pendapatan (dari pembayaran yang berstatus Lunas)
- Total Instruktur
- Pendaftaran Hari Ini
- Tabel 10 pendaftaran terbaru

### 7.2 Laporan Peserta

Menampilkan laporan data peserta secara lengkap.
- Dapat difilter berdasarkan rentang tanggal
- Pilih Tanggal Mulai dan Tanggal Akhir
- Klik "Tampilkan" untuk melihat data dalam rentang tersebut
- Klik "Cetak" untuk mencetak laporan

### 7.3 Laporan Instruktur

Menampilkan laporan data instruktur secara lengkap.
- Dapat difilter berdasarkan rentang tanggal
- Klik "Tampilkan" untuk melihat data
- Klik "Cetak" untuk mencetak laporan

### 7.4 Laporan Kursus

Menampilkan laporan data kursus.
- Dapat difilter berdasarkan rentang tanggal
- Klik "Tampilkan" untuk melihat data
- Klik "Cetak" untuk mencetak laporan

### 7.5 Laporan Pendaftaran

Menampilkan laporan data pendaftaran peserta.
- Dapat difilter berdasarkan rentang tanggal pendaftaran
- Klik "Tampilkan" untuk melihat data
- Klik "Cetak" untuk mencetak laporan

### 7.6 Laporan Pembayaran

Menampilkan laporan data pembayaran/transaksi.
- Dapat difilter berdasarkan rentang tanggal pembayaran
- Klik "Tampilkan" untuk melihat data
- Klik "Cetak" untuk mencetak laporan

### 7.7 Logout

- Klik tombol "Logout" di bagian bawah sidebar
- Aplikasi akan kembali ke halaman Login
- Dashboard Owner akan ditutup

## 8. Akun Default

Aplikasi menyediakan 2 akun default yang sudah disiapkan di database:

| Username | Password | Role |
|----------|----------|------|
| admin | admin123 | admin |
| owner | owner123 | owner |

> **Catatan:** Disarankan untuk mengubah password default melalui phpMyAdmin atau query SQL untuk keamanan:
> ```sql
> UPDATE users SET password='password_baru' WHERE username='admin';
> ```

## 9. Struktur Database

**Database:** `db_kursus`

**Tabel-tabel yang digunakan:**

### a. users - Data pengguna untuk login

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INT (PK, AI) | ID unik pengguna |
| username | VARCHAR(50) | Username untuk login |
| password | VARCHAR(255) | Password untuk login |
| role | ENUM | 'admin' atau 'owner' |

### b. kursus - Data kursus yang tersedia

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INT (PK, AI) | ID unik kursus |
| nama_kursus | VARCHAR(100) | Nama kursus |
| harga | DECIMAL(10,2) | Harga kursus (Rupiah) |

### c. instruktur - Data instruktur pengajar

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INT (PK, AI) | ID unik instruktur |
| nama | VARCHAR(100) | Nama instruktur |
| jenis_kelamin | ENUM | 'Laki-laki'/'Perempuan' |
| no_hp | VARCHAR(20) | Nomor telepon |
| usia | INT | Usia instruktur |
| kursus_id | INT (FK) | ID kursus yang diajar |
| alamat | TEXT | Alamat instruktur |

### d. peserta - Data peserta kursus

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INT (PK, AI) | ID unik peserta |
| nama | VARCHAR(100) | Nama peserta |
| jenis_kelamin | ENUM | 'Laki-laki'/'Perempuan' |
| no_hp | VARCHAR(20) | Nomor telepon |
| kursus_id | INT (FK) | ID kursus yang diambil |
| alamat | TEXT | Alamat peserta |
| tanggal_daftar | TIMESTAMP | Tanggal pendaftaran (auto) |

### e. jadwal - Data jadwal kursus

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INT (PK, AI) | ID unik jadwal |
| kursus_id | INT (FK) | ID kursus |
| instruktur_id | INT (FK) | ID instruktur |
| hari | VARCHAR(20) | Hari pelaksanaan |
| jam | VARCHAR(20) | Jam pelaksanaan |
| ruangan | VARCHAR(50) | Nama/nomor ruangan |

### f. pembayaran - Data transaksi pembayaran

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | INT (PK, AI) | ID unik pembayaran |
| peserta_id | INT (FK) | ID peserta |
| kursus_id | INT (FK) | ID kursus |
| total | DECIMAL(10,2) | Total pembayaran |
| status | ENUM | 'Lunas'/'Belum Lunas' |
| tanggal_pembayaran | TIMESTAMP | Tanggal bayar (auto) |

**Keterangan:**
- PK = Primary Key
- AI = Auto Increment
- FK = Foreign Key

## 10. Troubleshooting / FAQ

**T: Muncul pesan "Koneksi Database Gagal" saat login?**
> Pastikan MySQL Server sudah berjalan (cek XAMPP). Pastikan database "db_kursus" sudah dibuat dan konfigurasi koneksi di Koneksi.java sudah sesuai (host, port, username, password).

**T: Muncul pesan "Username atau Password salah"?**
> Periksa kembali username dan password yang dimasukkan. Gunakan akun default: admin/admin123 (admin) atau owner/owner123 (owner). Password bersifat case-sensitive.

**T: Data tidak muncul di tabel?**
> Pastikan tabel di database sudah berisi data. Jalankan file database.sql untuk mengisi data awal (seed data).

**T: Tombol "Tambah Kursus" tidak berfungsi?**
> Pastikan Anda menggunakan versi terbaru dari file kursus.java. Tombol sudah dihubungkan ke panel Tambahkursus.

**T: Field "Harga" menampilkan error saat simpan kursus?**
> Pastikan field Harga diisi dengan angka saja tanpa titik atau koma. Contoh yang benar: `500000`. Contoh yang salah: `500.000` atau `Rp 500000`.

**T: Bagaimana menambah akun pengguna baru?**
> Tambahkan langsung melalui phpMyAdmin atau MySQL CLI:
> ```sql
> INSERT INTO users (username, password, role) VALUES ('nama_user', 'password', 'admin');
> ```

**T: Bagaimana cara mencetak laporan (pada panel Owner)?**
> Klik tombol "Cetak" pada halaman laporan. Sistem akan membuka dialog cetak (Print Dialog) dari sistem operasi Anda. Pastikan printer sudah terhubung, atau pilih "Print to PDF" untuk menyimpan sebagai file PDF.

**T: Aplikasi berjalan lambat?**
> Pastikan MySQL Server berjalan dengan baik dan tidak ada proses berat lainnya. Restart aplikasi jika diperlukan.

## Catatan Akhir

- Selalu backup database secara berkala untuk menghindari kehilangan data
- Jangan bagikan kredensial login kepada pihak yang tidak berwenang
- Hubungi developer jika menemukan bug atau memerlukan fitur tambahan

---

*© 2026 - Sistem Informasi Kursus Komputer. Semua Hak Dilindungi.*
