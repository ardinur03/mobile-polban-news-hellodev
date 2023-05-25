import 'package:get/get.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:polban_news/data/apiClient/api_client.dart';
import 'package:polban_news/data/models/bookmark_model.dart';

class BookmarkController extends GetxController {
  RxList<News> news = RxList<News>();
  RxList<Bookmark> bookmark = RxList<Bookmark>();
  String btoken = '';

  // Fungsi untuk mendapatkan data berita yang sudah di bookmark
  void fetchBookmark() async {
    try {
      // Dapatkan List Bookmark
      news.value = await ApiClient().fetchNewsByBookmark();

      // Jika berhasil, beri pesan berhasil
      // Get.snackbar('Berhasil', 'Berhasil mendapatkan data berita');
    } catch (e) {
      print(e);
    }
  }

  // Fungsi untuk cek bearer token
  Future<String> fetchBearerToken() async {
    try {
      // Dapatkan bearer token
      btoken = await ApiClient().getBearerToken() as String;

      if (btoken == '' || btoken.isEmpty) {
        throw Exception('Anda belum login');
      }

      return btoken;
    } catch (e) {
      return '';
    }
  }

  @override
  void onReady() {
    super.onReady();
    fetchBookmark();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
