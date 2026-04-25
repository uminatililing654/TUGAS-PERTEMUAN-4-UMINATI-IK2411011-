# TUGAS-PERTEMUAN-4-UMINATI-IK2411011-
# 📘 Tugas Pertemuan 4 - Pemrograman Basis Data

 Identitas Mahasiswa

* **Nama** : UMINATI
* **NIM** : IK2411011
* **Mata Kuliah** : Pemrograman Basis Data
* **Topik** : Struktur Kontrol Percabangan (IF-THEN-ELSE dan CASE)

---
 Latar Belakang

Dalam pemrograman basis data, tidak semua proses dapat diselesaikan hanya dengan perintah dasar seperti SELECT, INSERT, UPDATE, dan DELETE. Diperlukan suatu mekanisme untuk mengambil keputusan berdasarkan kondisi tertentu.

Struktur kontrol percabangan seperti **IF-THEN-ELSE** dan **CASE** digunakan untuk menangani kondisi tersebut, sehingga sistem dapat berjalan secara dinamis sesuai dengan data yang diproses.

--- 🎯 Tujuan Tugas

Adapun tujuan dari tugas ini adalah:

1. Memahami konsep percabangan dalam pemrograman basis data
2. Menerapkan IF-THEN-ELSE dalam stored procedure
3. Menggunakan CASE dalam query SQL
4. Mengimplementasikan logika bisnis sederhana dalam database
5. Melakukan pengujian terhadap program yang dibuat

---

## 🧠 Deskripsi Implementasi

Pada tugas ini terdapat beberapa studi kasus yang diimplementasikan, yaitu:

### 1. Status Stok Barang

Menentukan kondisi stok barang berdasarkan jumlah stok:

* 0 → Habis
* 1–5 → Hampir Habis
* 6–20 → Tersedia
* > 20 → Stok Aman

Implementasi menggunakan **IF-THEN-ELSEIF** dalam stored procedure.

---

### 2. Status Produk Menggunakan CASE

Menampilkan status stok langsung pada query SELECT menggunakan **CASE** agar lebih ringkas dan mudah dibaca.

---

### 3. Perhitungan Diskon

Menentukan besaran diskon berdasarkan total belanja:

* ≥ 1.000.000 → 15%
* ≥ 500.000 → 10%
* ≥ 250.000 → 5%
* < 250.000 → 0%

Kemudian menghitung:

* jumlah diskon
* total bayar

---

### 4. Predikat Mahasiswa

Menentukan predikat dan status kelulusan mahasiswa berdasarkan nilai:

* 90–100 → Sangat Memuaskan
* 80–89 → Memuaskan
* 70–79 → Baik
* 60–69 → Cukup
* < 60 → Kurang

Status:

* ≥ 70 → Lulus
* < 70 → Tidak Lulus

---

## 🗂️ Struktur Repository

Repository ini terdiri dari beberapa file utama:

```bash
tugas-pertemuan4-uminati
│
├── program.sql
├── laporan.pdf
└── README.md
```

### Penjelasan:

* **program.sql** → Berisi seluruh script SQL:

  * pembuatan database
  * pembuatan tabel
  * insert data
  * stored procedure
  * query CASE
  * pengujian program

* **laporan.pdf** → Berisi analisis tugas dan dokumentasi hasil

* **README.md** → Dokumentasi repository

---

## ⚙️ Cara Menjalankan Program (Laragon)

### 1. Menjalankan Laragon

* Buka aplikasi Laragon
* Klik **Start All**
* Pastikan:

  * Apache aktif
  * MySQL aktif

---

### 2. Membuka Database Manager

Pilih salah satu:

* phpMyAdmin (via browser)
* HeidiSQL (lebih cepat untuk query)

---

### 3. Menjalankan Script SQL

1. Buka file `program.sql`
2. Copy seluruh isi script
3. Paste ke query editor
4. Klik **Run / Execute**

Script akan otomatis:

* membuat database
* membuat tabel
* mengisi data
* membuat procedure

---

### 4. Pengujian Program

#### 🔹 Cek Status Stok

```sql
CALL cek_status_stok(3);
```

#### 🔹 Cek Diskon

```sql
CALL hitung_diskon(750000);
```

#### 🔹 Cek Predikat Mahasiswa

```sql
CALL cek_predikat_mahasiswa(85);
```

#### 🔹 Query CASE Produk

```sql
SELECT * FROM produk;
```

---

## 📊 Contoh Hasil Output

### Status Stok

```
Status: Hampir Habis
```

### Diskon

```
Total Belanja : 750000
Diskon        : 10%
Jumlah Diskon : 75000
Total Bayar   : 675000
```

### Predikat Mahasiswa

```
Nilai     : 85
Predikat  : Memuaskan
Status    : Lulus
```

---

## 🔍 Analisis Singkat

Berdasarkan hasil pengujian:

* Semua percabangan berjalan sesuai kondisi
* IF digunakan untuk logika kompleks
* CASE lebih efektif untuk banyak kondisi dalam query
* Tidak ditemukan kesalahan logika pada program

---

## 🎯 Kesimpulan

Struktur kontrol percabangan sangat penting dalam pemrograman basis data karena memungkinkan sistem untuk:

* mengambil keputusan otomatis
* meningkatkan efisiensi proses
* menangani berbagai kondisi data

Penggunaan IF dan CASE yang tepat dapat membuat program lebih terstruktur, jelas, dan mudah dipahami.

---

🚀 Catatan Tambahan

* Gunakan MySQL melalui Laragon
* Pastikan tidak ada error saat menjalankan script
* Jika terjadi error, periksa:

  * delimiter
  * penulisan ELSEIF
  * urutan kondisi

---
