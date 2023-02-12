import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/presentation/homeguest_container_screen/models/homeguest_container_model.dart';
import 'package:polban_news/widgets/custom_bottom_bar.dart';

class HomeguestContainerController extends GetxController {
  Rx<HomeguestContainerModel> homeguestContainerModelObj =
      HomeguestContainerModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {}
}
