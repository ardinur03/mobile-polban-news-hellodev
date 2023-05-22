import 'package:get/get.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:polban_news/data/apiClient/api_client.dart';
import 'package:polban_news/data/models/bookmark_model.dart';

class DetailNewsController extends GetxController {
  late News news;
  RxList<Bookmark> bookmark = RxList<Bookmark>();

  RxBool bookmarkStatus = false.obs;
  RxBool loveStatus = false.obs;

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

  void testPrint() {
    print(bookmarkStatus.value);
    print(news.id);

    print("Hello");
  }

  void toggleBookmark() async {
    bookmarkStatus.toggle();

    try {
      if (bookmarkStatus.value == true) {
        ApiClient().addBookmark(news.id);

        Get.snackbar('Berhasil', 'Berhasil menambahkan bookmark');
      } else {
        ApiClient().deleteBookmark(news.id);

        Get.snackbar('Berhasil', 'Berhasil menghapus bookmark');
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambahkan bookmark: $e');
    }
  }

  void toggleLove() {
    loveStatus.toggle();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void onReady() {
    super.onReady();
    setStatus();
    testPrint();
  }
}
