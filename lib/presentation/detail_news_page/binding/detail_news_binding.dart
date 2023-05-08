import 'package:get/get.dart';
import 'package:polban_news/presentation/detail_news_page/controller/detail_news_controller.dart';

class DetailNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailNewsController());
  }
}
