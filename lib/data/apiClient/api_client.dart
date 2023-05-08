import 'package:polban_news/core/app_export.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Models
import 'package:polban_news/data/models/news_model.dart';

// URL
final String baseUrl = 'https://polbannews.site/api';

class ApiClient extends GetConnect {
  // Fungsi untuk mendapatkan seluruh data berita
  Future<List<News>> getAllNews() async {
    try {
      // Dapatkan data dari API
      final response =
          await http.get(Uri.parse('$baseUrl/news?date_filter=latest'));
      // Cek apakah berhasil mendapatkan data
      if (response.statusCode == 200) {
        // Jika berhasil, kembalikan data dalam bentuk model
        List<dynamic> newsJson = json.decode(response.body)['data'];

        // Ubah setiap created_at menjadi DateTime dengan melakukan konversi epoch
        newsJson = convertEPOC(newsJson);

        //
        List<News> news = newsJson.map((e) => News.fromJson(e)).toList();
        return news;
      }
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita');
    } catch (e) {
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita: $e');
    }
  }

  // Fungsi untuk mendapatkan data berita berdasarkan kategori pusat
  Future<List<News>> getPusatNews() async {
    try {
      // Dapatkan data dari API
      final response = await http
          .get(Uri.parse('$baseUrl/news?scope=pusat&date_filter=latest'));
      // Cek apakah berhasil mendapatkan data
      if (response.statusCode == 200) {
        // Jika berhasil, kembalikan data dalam bentuk model
        List<dynamic> newsJson = json.decode(response.body)['data'];

        // Ubah setiap created_at menjadi DateTime dengan melakukan konversi epoch
        newsJson = convertEPOC(newsJson);

        //
        List<News> news = newsJson.map((e) => News.fromJson(e)).toList();
        return news;
      }
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita');
    } catch (e) {
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita: $e');
    }
  }

  // Fungsi untuk mendapatkan data berita berdasarkan kategori himpunan
  Future<List<News>> getHimpunanNews() async {
    try {
      // Dapatkan data dari API
      final response = await http
          .get(Uri.parse('$baseUrl/news?scope=himpunan&date_filter=latest'));
      // Cek apakah berhasil mendapatkan data
      if (response.statusCode == 200) {
        // Jika berhasil, kembalikan data dalam bentuk model
        List<dynamic> newsJson = json.decode(response.body)['data'];

        // Ubah setiap created_at menjadi DateTime dengan melakukan konversi epoch
        newsJson = convertEPOC(newsJson);

        //
        List<News> news = newsJson.map((e) => News.fromJson(e)).toList();
        return news;
      }
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita');
    } catch (e) {
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita: $e');
    }
  }

  // Fungsi untuk mengubah epoch menjadi DateTime
  List<dynamic> convertEPOC(List<dynamic> newsJson) {
    return newsJson.map((data) {
      final epoch = data['created_at'];
      final date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);

      if (DateTime.now().difference(date).inMinutes <= 60) {
        data['created_at'] =
            '${DateTime.now().difference(date).inMinutes} menit yang lalu';
      } else if (DateTime.now().difference(date).inHours <= 24) {
        // Dalam jam
        data['created_at'] =
            '${DateTime.now().difference(date).inHours} jam yang lalu';
      } else {
        final dayTemp;
        final monthTemp;

        // Hari
        if (date.day < 10) {
          dayTemp = '0${date.day}';
        } else {
          dayTemp = date.day;
        }

        // Bulan
        if (date.month < 10) {
          monthTemp = '0${date.month}';
        } else {
          monthTemp = date.month;
        }

        data['created_at'] = '$dayTemp-$monthTemp-${date.year}';
      }
      return data;
    }).toList();
  }

  // Fungsi untuk search berita
  Future<List<News>> searchNews(String query) async {
    try {
      // Dapatkan data dari API dengan query pencarian
      final response = await http
          .get(Uri.parse('$baseUrl/news?date_filter=latest&title=$query'));
      // Cek apakah berhasil mendapatkan data
      if (response.statusCode == 200) {
        // Jika berhasil, kembalikan data dalam bentuk model
        List<dynamic> newsJson = json.decode(response.body)['data'];

        // Ubah setiap created_at menjadi DateTime dengan melakukan konversi epoch
        newsJson.forEach((data) {
          final epoch = data['created_at'];
          final date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);

          if (DateTime.now().difference(date).inMinutes <= 60) {
            data['created_at'] =
                '${DateTime.now().difference(date).inMinutes} menit yang lalu';
          } else if (DateTime.now().difference(date).inHours <= 24) {
            // Dalam jam
            data['created_at'] =
                '${DateTime.now().difference(date).inHours} jam yang lalu';
          } else {
            final dayTemp;
            final monthTemp;

            // Hari
            if (date.day < 10) {
              dayTemp = '0${date.day}';
            } else {
              dayTemp = date.day;
            }

            // Bulan
            if (date.month < 10) {
              monthTemp = '0${date.month}';
            } else {
              monthTemp = date.month;
            }

            data['created_at'] = '$dayTemp-$monthTemp-${date.year}';
          }
        });

        List<News> news = newsJson.map((e) => News.fromJson(e)).toList();
        return news;
      }
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita');
    } catch (e) {
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita: $e');
    }
  }

  Future<List<News>> fetchNewsDetails(int newsId) async {
    try {
      // Dapatkan data dari API
      final response = await http.get(Uri.parse('$baseUrl/news?id=$newsId'));
      // Cek apakah berhasil mendapatkan data
      if (response.statusCode == 200) {
        // Jika berhasil, kembalikan data dalam bentuk model
        List<dynamic> newsJson = json.decode(response.body)['data'];

        // Ubah setiap created_at menjadi DateTime dengan melakukan konversi epoch
        newsJson.forEach((data) {
          final epoch = data['created_at'];
          final date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);

          if (DateTime.now().difference(date).inMinutes <= 60) {
            data['created_at'] =
                '${DateTime.now().difference(date).inMinutes} menit yang lalu';
          } else if (DateTime.now().difference(date).inHours <= 24) {
            // Dalam jam
            data['created_at'] =
                '${DateTime.now().difference(date).inHours} jam yang lalu';
          } else {
            final dayTemp;
            final monthTemp;

            // Hari
            if (date.day < 10) {
              dayTemp = '0${date.day}';
            } else {
              dayTemp = date.day;
            }

            // Bulan
            if (date.month < 10) {
              monthTemp = '0${date.month}';
            } else {
              monthTemp = date.month;
            }

            data['created_at'] = '$dayTemp-$monthTemp-${date.year}';
          }
        });

        //
        List<News> news = newsJson.map((e) => News.fromJson(e)).toList();
        return news;
      }
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita');
    } catch (e) {
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data berita: $e');
    }
  }
}
