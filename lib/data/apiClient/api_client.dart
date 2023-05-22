import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Models
import 'package:polban_news/data/models/news_model.dart';
import 'package:polban_news/data/models/sliderNews_model.dart';
import 'package:polban_news/presentation/profile_page/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //Fungsi mengambil list image untuk slider dari API
  Future<List<sliderNews>> getSliderImage() async {
    try {
      // Dapatkan data dari API
      final response = await http.get(Uri.parse('$baseUrl/news-slides'));
      // Cek apakah berhasil mendapatkan data
      if (response.statusCode == 200) {
        // Jika berhasil, kembalikan data dalam bentuk model
        List<dynamic> sliderNewsJson = json.decode(response.body)['data'];

        // kembali dalam bentuk model
        List<sliderNews> slider =
            sliderNewsJson.map((e) => sliderNews.fromJson(e)).toList();

        return slider;
      }
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data slider');
    } catch (e) {
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data slider: $e');
    }
  }

  // Fungsi untuk mendapatkan bearer token dari SharedPreferences
  Future<String?> getBearerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }

  //Fungsi mengambil data user dari API
  Future<List<User>> getUser() async {
    try {
      // Dapatkan bearer token dari SharedPreferences
      String? token = await getBearerToken();

      // Pastikan token tidak null
      if (token == null) {
        throw Exception('Bearer token tidak tersedia');
        // Kembalikan ke halam sign in
      }

      // Dapatkan data dari API dengan menyertakan header Authorization
      final response = await http.get(
        Uri.parse('$baseUrl/user'),
        headers: {'Authorization': 'Bearer $token'},
      );

      // Cek apakah berhasil mendapatkan data
      if (response.statusCode == 200) {
        // Jika berhasil, kembalikan data dalam bentuk model
        List<dynamic> userJson = json.decode(response.body)['data'];

        // kembali dalam bentuk model
        List<User> user = userJson.map((e) => User.fromJson(e)).toList();

        return user;
      }

      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data user');
    } catch (e) {
      // Jika gagal, beri pesan error
      throw Exception('Gagal mendapatkan data user: $e');
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
