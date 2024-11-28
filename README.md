**Kalkulator Sederhana**
========================

Aplikasi Kalkulator Sederhana menggunakan Flutter untuk memenuhi tugas Mobile Programming.

**Informasi Tugas**
-------------------

* **NAMA**: FADHIL ADRIAN
* **NIM**: 2502121004
* **NAMA**: MOHAMAD RIZKI SEPTIYANTO
* **NIM**: 2502121704
    

**Deskripsi Proyek**
--------------------

Aplikasi ini merupakan implementasi dari kalkulator sederhana yang dapat melakukan operasi:

1.  Penjumlahan
    
2.  Pengurangan
    
3.  Perkalian
    
4.  Pembagian
    
5.  Reset (AC)
    
6.  Toggle tanda positif/negatif (+/-)
    

Selain itu, aplikasi mendukung **Light Mode** dan **Dark Mode** yang dapat diubah oleh pengguna.

**Teknologi yang Digunakan**
----------------------------

### **Framework & Tools**

1.  **Framework**: Flutter
    
2.  **Bahasa Pemrograman**: Dart
    
3.  **IDE**: Visual Studio Code & Android Studio
    
4.  **State Management**: Provider (untuk MVVM)
    
5.  **Device Testing**: Emulator Android (Pixel 8 - API 35)
    

### **Library yang Digunakan**

Library yang dipakai dapat dilihat di file pubspec.yaml, di antaranya:

*   provider: ^6.0.5 (State management)
    

**Persiapan Environment**
-------------------------

### **Spesifikasi Minimum**

*   **OS**: Windows/MacOS/Linux
    
*   **RAM**: 4GB (Disarankan 8GB untuk emulator)
    
*   **Flutter SDK**: Versi terbaru (min. 3.0)
    
*   **Android Studio**: Untuk emulator dan debugging
    

### **Instalasi Flutter**

1.  Download Flutter SDK sesuai OS Anda di [Flutter.dev](https://flutter.dev).
    
2.  Tambahkan Flutter ke PATH sistem Anda.
    
3.  Verifikasi instalasi:
   ```
    flutter doctor
   ```

**Cara Menjalankan Proyek**
---------------------------

Ikuti langkah-langkah berikut untuk menjalankan aplikasi:

### **1\. Clone Repository**

Clone repository dari GitHub:

```
git clone https://github.com/dsppr/kalkulator_sederhana.git
cd kalkulator_sederhana
```

### **2\. Install Dependencies**

Jalankan perintah berikut untuk mengunduh semua dependensi proyek:

```
flutter pub get
```

### **3\. Jalankan di Emulator atau Device**

1. Hubungkan perangkat fisik atau jalankan emulator Android (disarankan Pixel 5 - API 30).
    
2. Jalankan Aplikasi
   ```
    flutter run
   ```
    

**Fitur Aplikasi**
------------------

*   **Kalkulator Dasar**: Operasi tambah, kurang, kali, bagi.
    
*   **Reset (AC)**: Menghapus semua input.
    
*   **Toggle Positif/Negatif (+/-)**: Mengubah tanda angka.
    
*   **Light Mode & Dark Mode**: Tema aplikasi dapat diubah oleh pengguna.
    

**Screenshot Aplikasi**
-----------------------

### **Light Mode**

### **Dark Mode**

**Struktur Folder**
-------------------

```
lib/
├── models/            # Logika kalkulasi
│   └── calculator_model.dart
├── views/             # Tampilan (UI)
│   └── calculator_view.dart
├── controllers/       # Kontrol (MVC)
│   └── calculator_controller.dart
├── viewmodels/        # State management (MVVM)
│   └── calculator_viewmodel.dart
└── main.dart          # File utama
```

**Lifecycle Aplikasi**
----------------------

*   **onCreate():** Inisialisasi UI dan state awal aplikasi.
    
*   **onResume():** Aplikasi aktif dan menerima input.
    
*   **onPause():** Data sementara (angka yang diketik) disimpan.
    
*   **onDestroy():** Membersihkan resource jika diperlukan.
    

**Link Download**
-----------------

Aplikasi ini dapat diunduh melalui link berikut:

*   **Google Drive**: [Link Download APK](https://drive.google.com/drive/folders/1Tt8QGaQX86AMao_bj3maE2_FcMDgrGmf?usp=sharing)
    
*   **GitHub Repository**: [Link Repository](https://github.com/dsppr/kalkulator_sederhana)
    

**Kontributor**
---------------

Proyek ini dikerjakan oleh:

1.  **Fadhil Adrian** (2502121004)
2.  **Mohamad Rizki Septiyanto** (2502121704)
