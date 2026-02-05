# Dokumentasi Perubahan Database Multi-Gudang

## Ringkasan

Dokumen ini menjelaskan perubahan struktur database untuk mengimplementasikan fitur **Multi-Gudang** pada sistem inventory logistik.

---

## Tabel Baru

### 1. `gudang` - Master Data Gudang

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | bigint unsigned | Primary key |
| kode_gudang | varchar(20) | Kode unik gudang |
| nama_gudang | varchar(100) | Nama gudang |
| alamat | text | Alamat lengkap |
| no_telepon | varchar(20) | Nomor telepon |
| penanggung_jawab | varchar(100) | Nama penanggung jawab |
| is_active | tinyint(1) | Status aktif (1/0) |
| created_at | timestamp | Waktu dibuat |
| updated_at | timestamp | Waktu diupdate |
| deleted_at | timestamp | Soft delete |

### 2. `stok_gudang` - Stok Per Gudang

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | bigint unsigned | Primary key |
| gudang_id | bigint unsigned | FK ke tabel gudang |
| barang_id | bigint unsigned | FK ke tabel barang |
| stok_tersedia | int | Jumlah stok di gudang ini |
| stok_minimum | int | Batas minimum stok |
| stok_maksimum | int | Batas maksimum stok |
| lokasi_rak | varchar(50) | Lokasi rak/bin dalam gudang |
| created_at | timestamp | Waktu dibuat |
| updated_at | timestamp | Waktu diupdate |

**Constraint:** Kombinasi `gudang_id` + `barang_id` harus unik.

### 3. `transfer_barang` - Transfer Antar Gudang

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | bigint unsigned | Primary key |
| kode | varchar(50) | Kode unik transfer |
| tanggal | date | Tanggal transfer |
| gudang_asal_id | bigint unsigned | FK gudang pengirim |
| gudang_tujuan_id | bigint unsigned | FK gudang penerima |
| status | enum | draft, dalam_pengiriman, diterima, dibatalkan |
| user_id | bigint unsigned | User yang membuat |
| diterima_oleh | bigint unsigned | User yang menerima |
| tanggal_diterima | timestamp | Waktu diterima |
| catatan | text | Catatan transfer |
| created_at | timestamp | Waktu dibuat |
| updated_at | timestamp | Waktu diupdate |

### 4. `transfer_barang_detail` - Detail Transfer

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| id | bigint unsigned | Primary key |
| transfer_id | bigint unsigned | FK ke transfer_barang |
| barang_id | bigint unsigned | FK ke barang |
| jml_kirim | int | Jumlah yang dikirim |
| jml_diterima | int | Jumlah yang diterima |
| kondisi | enum | baik, rusak, diperbaiki |
| keterangan | text | Keterangan item |
| created_at | timestamp | Waktu dibuat |
| updated_at | timestamp | Waktu diupdate |

---

## Perubahan Tabel Existing

### 1. `users`

| Perubahan | Keterangan |
|-----------|------------|
| + `gudang_id` | User dapat di-assign ke gudang tertentu |

### 2. `pencatatan_barang`

| Perubahan | Keterangan |
|-----------|------------|
| + `gudang_id` | Transaksi masuk/keluar terjadi di gudang mana |

### 3. `permintaan_barang`

| Perubahan | Keterangan |
|-----------|------------|
| + `gudang_pemohon_id` | Gudang yang mengajukan permintaan |
| + `gudang_tujuan_id` | Gudang tujuan pengambilan barang |

### 4. `pemeliharaan_barang`

| Perubahan | Keterangan |
|-----------|------------|
| + `gudang_id` | Pemeliharaan dilakukan di gudang mana |

### 5. `barang`

| Perubahan | Keterangan |
|-----------|------------|
| `stok_tersedia` → `stok_total` | Rename untuk menunjukkan total stok semua gudang |

---

## Diagram Relasi

```
                                    ┌─────────────────┐
                                    │     gudang      │
                                    │─────────────────│
                                    │ id              │
                                    │ kode_gudang     │
                                    │ nama_gudang     │
                                    │ alamat          │
                                    │ no_telepon      │
                                    │ penanggung_jawab│
                                    │ is_active       │
                                    └────────┬────────┘
                                             │
              ┌──────────────────────────────┼──────────────────────────────┐
              │                              │                              │
              ▼                              ▼                              ▼
    ┌─────────────────┐           ┌─────────────────┐           ┌─────────────────┐
    │   stok_gudang   │           │ pencatatan_barang│          │ transfer_barang │
    │─────────────────│           │─────────────────│           │─────────────────│
    │ gudang_id (FK)  │           │ gudang_id (FK)  │           │ gudang_asal_id  │
    │ barang_id (FK)  │           │ ...             │           │ gudang_tujuan_id│
    │ stok_tersedia   │           └─────────────────┘           │ ...             │
    │ stok_minimum    │                                         └────────┬────────┘
    │ stok_maksimum   │                                                  │
    │ lokasi_rak      │                                                  ▼
    └────────┬────────┘                                         ┌─────────────────┐
             │                                                  │transfer_barang  │
             ▼                                                  │    _detail      │
    ┌─────────────────┐                                         │─────────────────│
    │     barang      │◄────────────────────────────────────────│ barang_id (FK)  │
    │─────────────────│                                         │ jml_kirim       │
    │ id              │                                         │ jml_diterima    │
    │ kode_barang     │                                         └─────────────────┘
    │ nama_barang     │
    │ stok_total      │
    │ ...             │
    └─────────────────┘

              ┌─────────────────┐           ┌─────────────────┐
              │ permintaan_barang│          │pemeliharaan_barang│
              │─────────────────│           │─────────────────│
              │ gudang_pemohon_id│          │ gudang_id (FK)  │
              │ gudang_tujuan_id │          │ ...             │
              │ ...             │           └─────────────────┘
              └─────────────────┘

              ┌─────────────────┐
              │     users       │
              │─────────────────│
              │ gudang_id (FK)  │
              │ ...             │
              └─────────────────┘
```

---

## Alur Proses Multi-Gudang

### 1. Barang Masuk
```
Supplier → Gudang A (pencatatan_barang.gudang_id = Gudang A)
         → Update stok_gudang (Gudang A, Barang X) += jumlah
         → Update barang.stok_total += jumlah
```

### 2. Barang Keluar
```
Gudang A → Tujuan (pencatatan_barang.gudang_id = Gudang A)
         → Update stok_gudang (Gudang A, Barang X) -= jumlah
         → Update barang.stok_total -= jumlah
```

### 3. Transfer Antar Gudang
```
Gudang A → Gudang B
  1. Buat transfer_barang (status: draft)
  2. Kirim (status: dalam_pengiriman)
     → stok_gudang (Gudang A) -= jumlah
  3. Terima (status: diterima)
     → stok_gudang (Gudang B) += jml_diterima
```

### 4. Permintaan Barang
```
User di Gudang A → Minta barang dari Gudang B
  - gudang_pemohon_id = Gudang A
  - gudang_tujuan_id = Gudang B
```

---

## Migrasi Data

Saat menjalankan script SQL:

1. **Gudang default** akan dibuat dengan kode `GDG-001`
2. **Stok existing** dari tabel `barang` akan dimigrasikan ke `stok_gudang`
3. **Transaksi existing** (`pencatatan_barang`, `pemeliharaan_barang`) akan di-assign ke gudang default

---

## File Terkait

- SQL Schema: `docs/multi_gudang_schema.sql`
- ERD Diagram: `docs/erd.png` (perlu diupdate)
- Schema Relasi: `docs/schema_relasi.md` (perlu diupdate)

---

## Catatan Implementasi

### Model Laravel yang perlu dibuat:
- `Gudang.php`
- `StokGudang.php`
- `TransferBarang.php`
- `TransferBarangDetail.php`

### Model Laravel yang perlu diupdate:
- `User.php` - tambah relasi `gudang()`
- `Barang.php` - tambah relasi `stokGudang()`
- `PencatatanBarang.php` - tambah relasi `gudang()`
- `PermintaanBarang.php` - tambah relasi `gudangPemohon()`, `gudangTujuan()`
- `PemeliharaanBarang.php` - tambah relasi `gudang()`

### Controller yang perlu dibuat:
- `GudangController.php`
- `StokGudangController.php`
- `TransferBarangController.php`

### Controller yang perlu diupdate:
- `BarangMasukController.php` - tambah pilihan gudang
- `BarangKeluarController.php` - tambah pilihan gudang
- `PermintaanBarangController.php` - tambah pilihan gudang
- `PemeliharaanBarangController.php` - tambah pilihan gudang
