---
config:
  layout: dagre
  theme: redux
---
flowchart TB
    BARANG["BARANG"] --- B_ID(["id"]) & B_KODE(["kode_barang"]) & B_NAMA(["nama_barang"]) & B_STOK(["stok_tersedia"]) & B_HARGA(["harga_satuan"]) & B_LOKASI(["lokasi_penyimpanan"]) & B_KONDISI(["kondisi_fisik"])
    KATEGORI_BARANG["KATEGORI_BARANG"] --- KB_ID(["id"]) & KB_KODE(["kode_kategori"]) & KB_NAMA(["nama_kategori"]) & HAS_KAT{"Memiliki Kategori"}
    SATUAN["SATUAN"] --- SAT_ID(["id"]) & SAT_NAMA(["nama_satuan"]) & HAS_SAT{"Memiliki Satuan"}
    USERS["USERS"] --- U_ID(["id"]) & U_NAMA(["name"]) & U_EMAIL(["email"]) & U_ROLE(["role"]) & DO_CATAT{"Mencatat"} & AJUKAN{"Mengajukan"} & APPROVE{"Menyetujui"} & PETUGAS{"Petugas"} & BUAT{"Membuat"} & VERIFIKASI{"Memverifikasi"}
    SUPPLIERS["SUPPLIERS"] --- SUP_ID(["id"]) & SUP_KODE(["kode_supplier"]) & SUP_NAMA(["nama_supplier"]) & SUP_TELP(["no_telepon"]) & SUPPLY{"Supply Barang"}
    HAS_KAT --- BARANG
    HAS_SAT --- BARANG
    PENCATATAN_BARANG["PENCATATAN_BARANG"] --- PB_ID(["id"]) & PB_KODE(["kode"]) & PB_TGL(["tanggal"]) & PB_JENIS(["jenis"]) & PB_NO_DOK(["no_dokumen"]) & HAS_DET_P{"Memiliki Detail"}
    PENCATATAN_DETAIL["PENCATATAN_BARANG_DETAIL"] --- PBD_ID(["id"]) & PBD_JML(["jml"]) & PBD_KONDISI(["kondisi"]) & CONTAINS_P{"Berisi Barang"}
    DO_CATAT --- PENCATATAN_BARANG
    SUPPLY --- PENCATATAN_BARANG
    HAS_DET_P --- PENCATATAN_DETAIL
    CONTAINS_P --- BARANG
    PERMINTAAN_BARANG["PERMINTAAN_BARANG"] --- PM_ID(["id"]) & PM_KODE(["kode"]) & PM_TGL(["tanggal"]) & PM_STATUS(["status"]) & PM_ALASAN(["alasan"]) & HAS_DET_PM{"Memiliki Detail"} & MENJADI{"Menjadi Transaksi"}
    PERMINTAAN_DETAIL["PERMINTAAN_BARANG_DETAIL"] --- PMD_ID(["id"]) & PMD_JML(["jml"]) & PMD_JML_APP(["jml_approval"]) & CONTAINS_PM{"Berisi Barang"}
    AJUKAN --- PERMINTAAN_BARANG
    APPROVE --- PERMINTAAN_BARANG
    HAS_DET_PM --- PERMINTAAN_DETAIL
    CONTAINS_PM --- BARANG
    MENJADI --- PENCATATAN_BARANG
    PEMELIHARAAN_BARANG["PEMELIHARAAN_BARANG"] --- PEM_ID(["id"]) & PEM_KODE(["kode"]) & PEM_TGL(["tanggal"]) & PEM_BIAYA(["biaya"]) & PEM_STATUS(["status"]) & HAS_DET_PEM{"Memiliki Detail"}
    PEMELIHARAAN_DETAIL["PEMELIHARAAN_BARANG_DETAIL"] --- PDET_ID(["id"]) & PDET_JML(["jml"]) & CONTAINS_PEM{"Berisi Barang"}
    PETUGAS --- PEMELIHARAAN_BARANG
    HAS_DET_PEM --- PEMELIHARAAN_DETAIL
    CONTAINS_PEM --- BARANG
    LAPORAN["LAPORAN"] --- L_ID(["id"]) & L_KODE(["kode_laporan"]) & L_JENIS(["jenis_laporan"]) & L_PERIODE_AWAL(["periode_awal"]) & L_PERIODE_AKHIR(["periode_akhir"]) & L_STATUS(["status_laporan"]) & HAS_VER{"Memiliki Verifikasi"}
    VERIFIKASI_LAPORAN["VERIFIKASI_LAPORAN"] --- VL_ID(["id"]) & VL_STATUS(["status_verifikasi"]) & VL_CATATAN(["catatan_verifikasi"])
    BUAT --- LAPORAN
    VERIFIKASI --- VERIFIKASI_LAPORAN
    HAS_VER --- VERIFIKASI_LAPORAN

     BARANG:::entity
     B_ID:::entity
     B_KODE:::entity
     B_NAMA:::entity
     B_STOK:::entity
     B_HARGA:::entity
     B_LOKASI:::entity
     B_KONDISI:::entity
     KATEGORI_BARANG:::entity
     KB_ID:::entity
     KB_KODE:::entity
     KB_NAMA:::entity
     HAS_KAT:::rel
     SATUAN:::entity
     SAT_ID:::entity
     SAT_NAMA:::entity
     HAS_SAT:::rel
     USERS:::entity
     U_ID:::entity
     U_NAMA:::entity
     U_EMAIL:::entity
     U_ROLE:::entity
     DO_CATAT:::rel
     AJUKAN:::rel
     APPROVE:::rel
     PETUGAS:::rel
     BUAT:::rel
     VERIFIKASI:::rel
     SUPPLIERS:::entity
     SUP_ID:::entity
     SUP_KODE:::entity
     SUP_NAMA:::entity
     SUP_TELP:::entity
     SUPPLY:::rel
     PENCATATAN_BARANG:::entity
     PB_ID:::entity
     PB_KODE:::entity
     PB_TGL:::entity
     PB_JENIS:::entity
     PB_NO_DOK:::entity
     HAS_DET_P:::rel
     PENCATATAN_DETAIL:::entity
     PBD_ID:::entity
     PBD_JML:::entity
     PBD_KONDISI:::entity
     CONTAINS_P:::rel
     PERMINTAAN_BARANG:::entity
     PM_ID:::entity
     PM_KODE:::entity
     PM_TGL:::entity
     PM_STATUS:::entity
     PM_ALASAN:::entity
     HAS_DET_PM:::rel
     MENJADI:::rel
     PERMINTAAN_DETAIL:::entity
     PMD_ID:::entity
     PMD_JML:::entity
     PMD_JML_APP:::entity
     CONTAINS_PM:::rel
     PEMELIHARAAN_BARANG:::entity
     PEM_ID:::entity
     PEM_KODE:::entity
     PEM_TGL:::entity
     PEM_BIAYA:::entity
     PEM_STATUS:::entity
     HAS_DET_PEM:::rel
     PEMELIHARAAN_DETAIL:::entity
     PDET_ID:::entity
     PDET_JML:::entity
     CONTAINS_PEM:::rel
     LAPORAN:::entity
     L_ID:::entity
     L_KODE:::entity
     L_JENIS:::entity
     L_PERIODE_AWAL:::entity
     L_PERIODE_AKHIR:::entity
     L_STATUS:::entity
     HAS_VER:::rel
     VERIFIKASI_LAPORAN:::entity
     VL_ID:::entity
     VL_STATUS:::entity
     VL_CATATAN:::entity
    classDef attr fill:#fff,stroke:#333,stroke-width:1px,stroke-dasharray: 5 5
    classDef rel fill:#fff, stroke:#333, stroke-width:2px, shape:rhombus
    classDef entity fill:#fff, stroke:#333, stroke-width:2px