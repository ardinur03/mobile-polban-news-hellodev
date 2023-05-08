import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    fetchNews('Semua');
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
  Future<void> fetchNews(String kategori) async {
    try {
      if (kategori == 'Pusat') {
        news.value = await ApiClient().getPusatNews();
      } else if (kategori == 'Himpunan') {
        news.value = await ApiClient().getHimpunanNews();
      } else if (kategori == 'Semua') {
        news.value = await ApiClient().getAllNews();
      } else {
        news.value = await ApiClient().getAllNews();
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data berita: $e');
    }
  }

  //Fungsi untuk mendapatkan Detail Berita
  Future<News?> fetchDetails(int newsId) async {
    try {
      List<News> newsList = await ApiClient().fetchNewsDetails(newsId);
      News? newsDetails = newsList.isNotEmpty ? newsList[0] : null;
      // Jika berhasil, beri pesan berhasil
      // Get.snackbar('Berhasil', 'Berhasil mendapatkan detail berita');
      return newsDetails;
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan detail berita: $e');
      rethrow;
    }
  }

  // Fungsi untuk refresh data berita dengan pull to refresh
  Future<void> refreshNews(String kategori) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      this.fetchNews(kategori);
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data berita: $e');
    }
  }

  // Fungsi untuk memuat data berita tambahan
  Future<void> loadMoreNews() async {
    try {
      List<News> additionalNews = await ApiClient().getAllNews();
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
