
# **Kalkulator Sederhana**  
Aplikasi Kalkulator Sederhana menggunakan Flutter untuk memenuhi tugas Mobile Programming.  

---

## **Informasi Tugas**  
**Kelompok 1:**  
- **Nama**: Fadhil Adrian  
  **NIM**: 2502121004  
- **Nama**: Mohamad Rizki Septiyanto  
  **NIM**: 2502121704  

---

## **Deskripsi Proyek**  
Aplikasi ini adalah implementasi kalkulator sederhana berbasis Flutter yang mampu melakukan:  
1. Operasi Matematika Dasar: Penjumlahan, Pengurangan, Perkalian, dan Pembagian.  
2. Fitur Tambahan: Reset (AC) dan Toggle Tanda Positif/Negatif (+/-).  
3. Tema: Mendukung **Light Mode** dan **Dark Mode** yang dapat diubah oleh pengguna.  

---

## **Teknologi yang Digunakan**  

### **Framework & Tools**  
- **Framework**: Flutter  
- **Bahasa Pemrograman**: Dart  
- **IDE**: Visual Studio Code dan Android Studio  
- **State Management**: Provider (MVVM Pattern)  
- **Device Testing**: Emulator Android (Pixel 6 - API 33)  

### **Library yang Digunakan**  
- `provider`: **State management** untuk memisahkan logika dari UI.  
- `math_expressions`: Mengevaluasi ekspresi matematika.  
- `intl`: Memformat angka hasil kalkulasi.  

---

## **Cara Menjalankan Proyek**  

### **1. Clone Repository**  
Clone repository dari GitHub:  
```bash
git clone https://github.com/dsppr/kalkulator_sederhana.git
cd kalkulator_sederhana
```  

### **2. Install Dependencies**  
Jalankan perintah berikut untuk mengunduh semua dependensi proyek:  
```bash
flutter pub get
```  

### **3. Jalankan di Emulator atau Device**  
1. Hubungkan perangkat fisik atau jalankan emulator Android (disarankan Pixel 6 - API 33).  
2. Jalankan aplikasi dengan perintah:  
```bash
flutter run
```  

---

## **Fitur Aplikasi**  
- **Kalkulator Dasar**: Operasi tambah, kurang, kali, dan bagi.  
- **Reset (AC)**: Menghapus semua input.  
- **Toggle Positif/Negatif (+/-)**: Mengubah tanda angka.  
- **Light Mode & Dark Mode**: Tema aplikasi dapat disesuaikan dengan preferensi pengguna.  

---

## **Struktur Folder**  

```
lib/
├── models/
│   └── calculator_model.dart
├── viewmodels/
│   └── calculator_view_model.dart
├── views/
│   └── home_screen.dart
└── main.dart
```

---

## **Lifecycle Aplikasi**  
### **Android Lifecycle**  
1. **onCreate()**:  
   - Inisialisasi aplikasi. Flutter memuat framework dan menjalankan `main()`.  

2. **onResume()**:  
   - Aplikasi aktif dan siap menerima input dari pengguna.  

3. **onPause()**:  
   - Aplikasi berhenti sementara. Input yang belum dihitung tetap tersimpan dalam state.  

4. **onDestroy()**:  
   - Aktivitas dihentikan sepenuhnya jika pengguna keluar dari aplikasi.  

### **Flutter Widget Lifecycle**  
- **build()**:  
  - UI dirender ulang setiap kali ada perubahan state pada `CalculatorViewModel`.

---

## **Screenshot Aplikasi**  

### **Light Mode**  
![image](/dark_mode_kalkulator.png)  

### **Dark Mode**  
![image](/light_mode_kalkulator.png)    

---

## **Link Download**  

- **Google Drive**: [Unduh APK](https://drive.google.com/drive/folders/1Tt8QGaQX86AMao_bj3maE2_FcMDgrGmf?usp=sharing)  
- **GitHub Repository**: [Lihat Kode](https://github.com/dsppr/kalkulator_sederhana)  

---

## **Kontributor**  
Proyek ini dikerjakan oleh:  
1. **Fadhil Adrian** (2502121004)  
2. **Mohamad Rizki Septiyanto** (2502121704)  

---
