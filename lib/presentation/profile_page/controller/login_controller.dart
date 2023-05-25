import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/data/apiClient/api_client.dart';
import 'package:polban_news/presentation/profile_page/model/profile_model.dart';

class TokenController {
  RxList<User> userList = RxList<User>();

  Future<void> fecthUser() async {
    try {
      userList.value = await ApiClient().getUser();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data slider : $e');
    }
  }
}
