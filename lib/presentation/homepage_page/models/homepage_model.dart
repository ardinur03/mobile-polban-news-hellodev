import 'package:get/get.dart';
import 'homepage_item_model.dart';

class HomepageModel {
  RxList<HomepageItemModel> homepageItemList =
      RxList.filled(3, HomepageItemModel());
}
