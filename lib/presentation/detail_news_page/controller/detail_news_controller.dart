import 'package:get/get.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:polban_news/data/apiClient/api_client.dart';
import 'package:polban_news/data/models/bookmark_model.dart';

class DetailNewsController extends GetxController {
  late News news;
  RxList<Bookmark> bookmark = RxList<Bookmark>();

  RxBool bookmarkStatus = false.obs;
  RxBool loveStatus = false.obs;
  String btoken = '';

  void setNews(News news) {
    this.news = news;
  }

  void setStatus() async {
    // Dapatkan List Bookmark
    bookmark.value = await ApiClient().fetchAllBookmark();

    // Cek apakah berita sudah ada di bookmark
    for (int i = 0; i < bookmark.length; i++) {
      if (bookmark[i].id_news == news.id) {
        bookmarkStatus.value = true;
        break;
      }
    }
  }

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

  void toggleBookmark() async {
    // Cek btoken
    try {
      btoken = await fetchBearerToken();

      if (btoken == '' || btoken.isEmpty) {
        Get.snackbar('Maaf', 'Anda belum login');
      } else {
        bookmarkStatus.toggle();

        if (bookmarkStatus.value == true) {
          ApiClient().addBookmark(news.id);

          Get.snackbar('Berhasil', 'Berhasil menambahkan bookmark');
        } else {
          ApiClient().deleteBookmark(news.id);

          Get.snackbar('Berhasil', 'Berhasil menghapus bookmark');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan');
    }
  }

  void toggleLove() {
    Get.snackbar('Maaf', 'Untuk sementara fitur ini belum tersedia');
  }

  @override
  void onInit() {
    super.onInit();
  }

  void onReady() {
    super.onReady();
    setStatus();
  }
}
