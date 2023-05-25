
# polban_news

<div>
  <h1 align="center">Selamat Datang di Polban News 🚀 </h1>
  <strong>
    Dibuat dengan menggunakan framework Flutter
  </strong>
  <p>
    ini adalah dokumentasi sederhana mengenai beberapa hal dari aplikasi yang telah kita buat.
  </p>
</div>


### Table of Contents
- [System Requirements](#system-requirements)
- [Project Structure](#project-structure)

### System Requirements

Dart SDK Version 2.18.0 atau lebih besar.
Flutter SDK Version 3.3.0 atau lebih besar.

### Project Structure

Struktur project yang kita buat secara umum seperti berikut:

```
.
├── android                         - berisi file dan folder yang diperlukan untuk menjalankan aplikasi pada sistem operasi Android
├── assets                          - berisi semua gambar dan font aplikasi
├── lib                             - Folder yang paling penting dalam proyek, digunakan untuk menulis sebagian besar kode
    ├── main.dart                   - main.dart - titik awal aplikasi
    ├── core
    │   ├── app_export.dart         - berisi impor file yang sering digunakan
    │   ├── constants               - berisi semua kelas konstanta
    │   ├── errors                  - berisi kelas penanganan kesalahan                
    │   ├── network                 - berisi kelas terkait jaringan
    │   └── utils                   - berisi file dan utilitas umum proyek
    ├── data
    │   ├── apiClient               - apiClient - berisi metode-metode pemanggilan API
    │   ├── models                  - berisi model permintaan/respon
    │   └── repository              - repositori jaringan
    ├── localization                - berisi kelas-kelas lokalisasi
    ├── presentation                - berisi semua layar dan pengendali layar
    │   └── screens                 - berisi semua informasi terkait layar (model, view, controller)
    ├── routes                      - berisi rute aplikasi
    └── theme                       - berisi kelas tema dan dekorasi aplikasi
    └── widgets                     - berisi semua kelas widget kustom
```