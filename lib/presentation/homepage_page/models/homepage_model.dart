import 'package:get/get.dart';
import 'homepage_item_model.dart';

class HomepageModel {
  RxList<HomepageItemModel> homepageItemList = RxList.filled(
      3,
      HomepageItemModel(
        id: "",
        user_id: "",
        title: "",
        slug: "",
        brief_overview: "",
        content: "",
        reading_time: "",
        status: "",
        deleted_at: "",
        created_at: "",
        updated_at: "",
      ));
}
