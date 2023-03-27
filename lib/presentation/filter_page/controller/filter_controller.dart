// ignore_for_file: unused_import

import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/presentation/filter_page/models/filter_model.dart';
import 'package:polban_news/widgets/custom_bottom_bar.dart';
import 'package:polban_news/data/apiClient/api_client.dart';
import 'package:polban_news/data/models/news_model.dart';

class FilterController extends GetxController {
  RxList<News> news = RxList<News>();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  // Fungsi untuk search berita
  Future<void> queryNews(String keyword) async {
    try {
      news.value = await ApiClient().searchNews(keyword);
      // Jika berhasil, beri pesan berhasil
      Get.snackbar('Berhasil', 'Berhasil mendapatkan data berita');
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data berita: $e');
    }
  }
}
