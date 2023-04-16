import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/data/apiClient/api_client.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:polban_news/presentation/detail_news_page/detail_news_screen.dart';

class HomepageController extends GetxController {
  RxList<News> news = RxList<News>();

  @override
  void onReady() {
    super.onReady();
    fetchNews();
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
  Future<void> refreshNews() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      this.fetchNews();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data berita: $e');
    }
  }

  void refreshUI() {
    update();
  }
}
