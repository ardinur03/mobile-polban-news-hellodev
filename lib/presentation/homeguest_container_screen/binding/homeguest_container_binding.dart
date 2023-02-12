import '../controller/homeguest_container_controller.dart';
import 'package:get/get.dart';

class HomeguestContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeguestContainerController());
  }
}
