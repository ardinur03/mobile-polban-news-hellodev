
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
├── android                         - contains files and folders required for running the application on an Android operating system.
├── assets                          - contains all images and fonts of your application.
├── ios                             - contains files required by the application to run the dart code on iOS platforms.
├── lib                             - Most important folder in the project, used to write most of the Dart code.
    ├── main.dart                   - starting point of the application
    ├── core
    │   ├── app_export.dart         - contains commonly used file imports 
    │   ├── constants               - contains all constants classes
    │   ├── errors                  - contains error handling classes                  
    │   ├── network                 - contains network related classes
    │   └── utils                   - contains common files and utilities of project
    ├── data
    │   ├── apiClient               - contains API calling methods 
    │   ├── models                  - contains request/response models 
    │   └── repository              - network repository
    ├── localization                - contains localization classes
    ├── presentation                - contains all screens and screen controllers
    │   └── screens                 - contains all screens
    ├── routes                      - contains all the routes of application
    └── theme                       - contains app theme and decoration classes
    └── widgets                     - contains all custom widget classes
```