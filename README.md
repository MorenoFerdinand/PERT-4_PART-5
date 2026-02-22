# part_5

# Shopping Cart Hands-On

## Deskripsi:
Proyek ini adalah bentuk aplikasi praktis dari sistem keranjang belanja mini yang dibangun di atas framework Flutter. Tujuan utama pengembangan aplikasi ini adalah untuk mengeksplorasi penggunaan ChangeNotifier dalam mengelola state global, sehingga integrasi data antar halaman dalam aplikasi mobile dapat berjalan dengan mulus.

Melalui aplikasi ini, pengguna diberikan kemudahan untuk menjelajahi katalog barang, memasukkan produk ke dalam daftar belanja, memodifikasi kuantitas tiap item, melakukan penghapusan produk, hingga memantau kalkulasi harga total secara otomatis sebelum tahap pembayaran.

## Fitur-Fitur:
- Model produk
- Model keranjang belanja dengan ChangeNotifier
- Halaman daftar produk
- Tombol Tambah ke Keranjang
- Lencana keranjang belanja yang menunjukkan jumlah barang
- Halaman keranjang belanja dengan semua item
- Menambah/mengurangi kuantitas
- Hapus tombol item
- Perhitungan harga total
- Pesan keranjang kosong

## Struktur Folder

```
lib/
│
├── models/
│   ├── product.dart
│   ├── cart_item.dart
│   └── cart_model.dart
│
├── pages/
│   ├── product_list_page.dart
│   └── cart_page.dart
│
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

Proyek ini membuktikan efisiensi Provider dalam menyederhanakan manajemen state global pada ekosistem Flutter. Dengan mengintegrasikan ChangeNotifier, antarmuka pengguna (UI) dapat bereaksi dan diperbarui secara otomatis tanpa proses prop drilling atau pengiriman data manual antar widget yang rumit.

Penerapan arsitektur yang memisahkan antara Logika Bisnis (Model) dan Antarmuka (Pages) tidak hanya meningkatkan keterbacaan kode (clean code), tetapi juga mempermudah skalabilitas proyek di masa depan, seperti integrasi dengan database lokal maupun API eksternal.

---
