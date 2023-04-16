import 'package:get/get.dart';
import 'package:polban_news/data/models/news_model.dart';

class DetailNewsController extends GetxController {
  News? news;
  bool isLoading = false;

  final bookmarkStatus = false.obs;
  final loveStatus = false.obs;

  void toggleBookmark() {
    bookmarkStatus.toggle();
  }

  void toggleLove() {
    loveStatus.toggle();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
