// ignore_for_file: cast_from_null_always_fails, non_constant_identifier_names

import 'package:polban_news/core/app_export.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Models
import 'package:polban_news/data/models/news_model.dart';
import 'package:polban_news/data/models/sliderNews_model.dart';
import 'package:polban_news/presentation/profile_page/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:polban_news/data/models/bookmark_model.dart';

// URL
final String baseUrl = 'https://polbannews.site/api';
bool isLogout = false;

// Token
// ignore: unnecessary_cast
String? bearerToken = isLogout ? null : (ApiClient().setToken()) as String;

class ApiClient extends GetConnect {
  //Set beare token with shared_preferences
  Future<String?> setToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bearerToken = prefs.getString('token') as String;
    print(bearerToken);
    try {
      bearerToken = prefs.getString('token') as String;
    } catch (e) {
      bearerToken = '';
    }

    return bearerToken;
  }

  //get beareerToken
  String? getToken() {
    return bearerToken;
  }

  bool clearToken() {
    // bearerToken = null;
    return isLogout = true;
  }

  String? clearBearerToken() {
    bearerToken = null;
    return bearerToken;
  }

  // Fungsi untuk mendapatkan seluruh data berita
  Future<List<News>> getAllNews() async {
    try {
      // Dapatkan data dari API
      final response = await http
          .get(Uri.parse('$baseUrl/news?date_filter=latest&limit=20'));
      // Cek apakah berhasil mendapatkan data
      if (response.statusCode == 200) {
        // Jika berhasil, kembalikan data dalam bentuk model
        List<dynamic> newsJson = json.decode(response.body)['data'];

        // Ubah setiap created_at menjadi DateTime dengan melakukan konversi epoch
        newsJson = convertEPOC(newsJson);

        //
        List<News> news = newsJson.map((e) => News.fromJson(e)).toList();

        return news;
      } else {
        // Jika gagal, beri pesan error
        throw Exception('Gagal mendapatkan data berita');
      }
    } catch (e) {
      // Jika gagal, beri pesan error
      throw Exception(e);
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
      throw Exception(e);
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
      throw Exception(e);
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
      throw Exception(e);
    }
  }

  // Fungsi untuk mendapatkan bearer token dari SharedPreferences
  Future<String?> getBearerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }

  // Fungsi mengambil data user dari API
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
      throw Exception(e);
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
      throw Exception(e);
    }
  }

  // Fungsi untuk mendapatkan detail berita
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
      throw Exception(e);
    }
  }

  // Fungsi untuk mendapatkan data bookmark
  Future<List<Bookmark>> fetchAllBookmark() async {
    try {
      // Dapatkan data dari API
      final url = Uri.parse('$baseUrl/bookmarks');
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );

      print(response);

      if (response.statusCode == 200 && bearerToken != '') {
        // Jika berhasil, kembalikan data dalam bentuk model
        List<dynamic> bookmarkJson = json.decode(response.body)['data'];

        List<Bookmark> bookmarks =
            bookmarkJson.map((e) => Bookmark.fromJson(e)).toList();
        return bookmarks;
      } else {
        if (bearerToken == '') {
          throw Exception('Anda belum login');
        } else {
          throw Exception('Gagal mendapatkan data bookmark');
        }
      }
    } catch (e) {
      // Jika gagal, beri pesan error
      return [];
    }
  }

  // Fungsi untuk menambahkan bookmark
  void addBookmark(int newsId) async {
    try {
      // Kirim permintaan POST untuk menambahkan bookmark
      final url = Uri.parse('$baseUrl/bookmark-new');
      final response = await http.post(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
        body: {'news_id': newsId.toString()},
      );

      if (response.statusCode == 200 && bearerToken != '') {
        // Berhasil menambahkan bookmark
        print('Berhasil menambahkan bookmark');
      } else {
        // Tangani jika permintaan tidak berhasil
        if (bearerToken == '') {
          throw Exception('Anda belum login');
        } else {
          throw Exception('Gagal menambahkan bookmark');
        }
      }
    } catch (e) {
      // Tangani jika terjadi kesalahan
      print(e);
    }
  }

  // Fungsi untuk menghapus bookmark
  void deleteBookmark(int newsId) async {
    try {
      // Dapatkan id_bookmark yang memiliki id_news yang sama dengan newsId
      List<Bookmark> bookmarks = await fetchAllBookmark();
      Bookmark bookmark =
          bookmarks.firstWhere((element) => element.id_news == newsId);

      // Kirim permintaan POST untuk menambahkan bookmark
      final url = Uri.parse('$baseUrl/bookmark-delete');
      final response = await http.post(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
        body: {'id_bookmark': bookmark.id_bookmark.toString()},
      );

      if (response.statusCode == 200 && bearerToken != '') {
        // Berhasil menambahkan bookmark
        print('Berhasil menghapus bookmark');
      } else {
        // Tangani jika permintaan tidak berhasil
        if (bearerToken == '') {
          throw Exception('Anda belum login');
        } else {
          throw Exception('Gagal menghapus bookmark');
        }
      }
    } catch (e) {
      // Tangani jika terjadi kesalahan
      print(e);
    }
  }

  // Fungsi untuk mendapatkan semua berita yang ada di bookmark
  Future<List<News>> fetchNewsByBookmark() async {
    try {
      // Dapatkan List Bookmark
      List<Bookmark> bookmarks = await fetchAllBookmark();

      // Dapatkan List News berdasarkan id_news yang ada di List Bookmark
      List<News> allNews = await getAllNews();
      List<News> news =
          <News>[]; // Menentukan tipe data List sebagai List<News>

      List<int> news_id_1 = allNews.map((news) => news.id).toList();
      print('allNews.id: $news_id_1');

      List<int> news_id_2 =
          bookmarks.map((bookmark) => bookmark.id_news).toList();
      print('allNews.id: $news_id_2');

      List<int> intersect =
          news_id_1.where((id) => news_id_2.contains(id)).toList();
      print('intersect: $intersect');

      intersect.forEach((id) {
        news.add(allNews.firstWhere((news) => news.id == id));
      });

      return news;
    } catch (e) {
      throw Exception('Gagal mendapatkan data berita pada bookmark: $e');
    }
  }
}
