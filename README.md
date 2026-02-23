# part_5

# Shopping Cart Hands-On

## Deskripsi:
Proyek ini adalah bentuk aplikasi praktis dari sistem keranjang belanja mini yang dibangun di atas framework Flutter. Tujuan utama pengembangan aplikasi ini adalah untuk mengeksplorasi penggunaan ChangeNotifier dalam mengelola state global, sehingga integrasi data antar halaman dalam aplikasi mobile dapat berjalan dengan mulus.

Melalui aplikasi ini, pengguna diberikan kemudahan untuk menjelajahi katalog barang, memasukkan produk ke dalam daftar belanja, memodifikasi kuantitas tiap item, melakukan penghapusan produk, hingga memantau kalkulasi harga total secara otomatis sebelum tahap pembayaran.

# 🛒 Shopping Cart Hands-On with Product Search

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

Proyek ini adalah aplikasi praktis sistem keranjang belanja mini yang dibangun di atas framework Flutter. Fokus utama proyek ini adalah demonstrasi manajemen state global menggunakan `ChangeNotifier` dan pengayaan fitur navigasi melalui sistem pencarian produk yang dinamis.

---

## Fitur Utama

- **Real-Time Product Search:** Fitur unggulan yang memungkinkan pengguna mencari produk secara instan melalui overlay pencarian yang responsif.
- **Global State Management:** Sinkronisasi data keranjang belanja di seluruh halaman aplikasi menggunakan `Provider`.
- **Dynamic Cart System:** - Lencana (Badge) jumlah barang yang terupdate otomatis.
  - Penyesuaian kuantitas produk (Increment/Decrement).
  - Penghapusan item dengan feedback SnackBar.
- **Automated Calculation:** Perhitungan total belanja secara real-time.
- **Responsive UI:** Layout Grid yang adaptif untuk katalog produk dan list yang bersih untuk halaman keranjang.

---

## Arsitektur & Nilai Tambah

### Nilai Tambah: Integrated Search System
Salah satu keunggulan teknis dalam proyek ini adalah implementasi **`SearchDelegate`**. Daripada hanya menampilkan daftar statis, aplikasi ini menyediakan antarmuka pencarian native yang:
1. **Meningkatkan UX:** Memberikan animasi transisi yang halus dan standar industri.
2. **Actionable Results:** Memungkinkan pengguna menambahkan barang ke keranjang langsung dari layar hasil pencarian.
3. **Clean Implementation:** Memisahkan logika filter dari widget utama, menjaga kode tetap modular.

### Manajemen State
Menggunakan **Provider Pattern** untuk menghindari *prop drilling*. `CartModel` bertindak sebagai *Single Source of Truth* yang memberitahu UI (`notifyListeners()`) setiap kali ada perubahan pada data keranjang.

---

## Struktur Folder

```text
lib/
├── models/
│   ├── product.dart
│   ├── cart_item.dart
│   └── cart_model.dart
├── pages/
│   ├── product_list_page.dart
│   └── cart_page.dart
├── widgets/
│   └── product_search.dart
└── main.dart
```

## Penjelasan Arsitektur

### Product Model

Digunakan untuk merepresentasikan data produk seperti id, nama, harga, gambar, dan kategori.

### CartItem Model

Menyimpan informasi produk yang dimasukkan ke keranjang beserta jumlahnya. Menyediakan properti kalkulasi total harga.

### CartModel

Merupakan pusat state aplikasi yang mengatur:

* Penyimpanan item cart
* Penambahan produk
* Penghapusan produk
* Perubahan kuantitas
* Perhitungan total harga
* Notifikasi UI menggunakan notifyListeners()

Menggunakan struktur Map untuk akses cepat berdasarkan product ID.

### Provider

ChangeNotifierProvider digunakan pada root aplikasi sehingga seluruh halaman dapat mengakses state cart tanpa prop drilling.

---

## Cara Menjalankan Project

1. Clone repository atau salin source code
2. Jalankan perintah berikut pada terminal

```
flutter pub get
```

3. Jalankan aplikasi

```
flutter run
```

Pastikan Flutter SDK sudah terinstall dan device/emulator aktif.

---

## Cara Penggunaan Aplikasi

1. Buka aplikasi
2. Pilih produk dari halaman utama
3. Tekan tombol Add untuk memasukkan ke cart
4. Tekan ikon cart untuk membuka halaman keranjang
5. Gunakan tombol tambah/kurang untuk mengubah jumlah
6. Hapus item jika diperlukan
7. Tekan Checkout untuk menyelesaikan simulasi pembelian

---

## Pengujian Fungsional

Pengujian manual dilakukan dengan skenario berikut:

- Menambahkan produk beberapa kali
- Menambahkan produk berbeda
- Mengubah jumlah item
- Menghapus item
- Mengosongkan cart
- Navigasi antar halaman

Seluruh fungsi berjalan sesuai harapan dan state tetap konsisten antar halaman.

---

## Kesimpulan

Proyek ini mendemonstrasikan efisiensi Flutter dalam menangani logika aplikasi e-commerce yang kompleks secara sederhana. Dengan memisahkan Logika Bisnis (Model) dari Antarmuka (View), aplikasi ini tidak hanya mudah dibaca (Clean Code) tetapi juga siap untuk dikembangkan lebih lanjut (skalabel), seperti integrasi ke API Backend atau Firebase.

Implementasi fitur Search mempertegas bahwa aplikasi ini dibangun dengan memperhatikan sisi fungsionalitas dan kenyamanan pengguna secara optimal.

---
LAMPIRAN:

Halaman Utama saat masuk web Shopping.
<img width="1920" height="1080" alt="Screenshot (469)" src="https://github.com/user-attachments/assets/01465f53-a319-4a4b-8cb2-791c401af906" />

Ketika klik "Add" pada salah satu barang, maka barang tersebut akan masuk dalam trolli belanjaan.
<img width="1920" height="1080" alt="Screenshot (470)" src="https://github.com/user-attachments/assets/d17b248d-b8c5-484b-97e5-4d90f1f6ce5e" />

Tampilan search, dan halaman untuk mencari nama barang sesuai dengan nama nya.

<img width="1920" height="1080" alt="Screenshot (471)" src="https://github.com/user-attachments/assets/a4efb3c0-4eca-44dd-9112-376176dc04e2" />
