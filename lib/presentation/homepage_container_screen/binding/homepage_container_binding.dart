import '../controller/homepage_container_controller.dart';
import 'package:get/get.dart';

class HomepageContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomepageContainerController());
  }
}
