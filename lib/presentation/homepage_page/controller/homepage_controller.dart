import 'package:flutter/widgets.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/data/apiClient/api_client.dart';
import 'package:polban_news/data/models/news_model.dart';

class HomepageController extends GetxController {
  RxList<News> news = RxList<News>();

  ScrollController scrollController = ScrollController();

  @override
  void onReady() {
    super.onReady();
    fetchNews();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      loadMoreNews();
    }
  }

  // Fungsi untuk mendapatkan data berita
  Future<void> fetchNews() async {
    try {
      news.value = await ApiClient().getNews();
      // Jika berhasil, beri pesan berhasil
      Get.snackbar('Berhasil', 'Berhasil mendapatkan data berita');
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data berita: $e');
    }
  }

  // Fungsi untuk refresh data berita dengan pull to refresh
  Future<void> refreshNews() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      this.fetchNews();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data berita: $e');
    }
  }

  // Fungsi untuk memuat data berita tambahan
  Future<void> loadMoreNews() async {
    try {
      List<News> additionalNews = await ApiClient().getNews();
      news.addAll(additionalNews);
      update();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data berita tambahan: $e');
    }
  }

  void refreshUI() {
    update();
  }
}
