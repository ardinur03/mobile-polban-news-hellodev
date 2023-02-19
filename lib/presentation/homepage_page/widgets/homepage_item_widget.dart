import '../controller/homepage_controller.dart';
import '../models/homepage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';

// ignore: must_be_immutable
class HomepageItemWidget extends StatelessWidget {
  HomepageItemWidget(this.homepageItemModelObj);

  HomepageItemModel homepageItemModelObj;

  var controller = Get.find<HomepageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        top: 4,
        bottom: 4,
      ),
      decoration: AppDecoration.outlineBlack90019.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImagepicture,
            height: getVerticalSize(
              126.00,
            ),
            width: getHorizontalSize(
              134.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                10.00,
              ),
            ),
            margin: getMargin(
              top: 1,
              bottom: 3,
            ),
          ),
          Padding(
            padding: getPadding(
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "lbl_info_ukt".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterBold14LightblueA700,
                ),
                Container(
                  width: getHorizontalSize(
                    178.00,
                  ),
                  margin: getMargin(
                    top: 8,
                  ),
                  child: Text(
                    "msg_lorem_ipsum_dolor2".tr,
                    maxLines: null,
                    textAlign: TextAlign.justify,
                    style: AppStyle.txtInterMedium12,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 3,
                  ),
                  child: Text(
                    "msg_admin_pusat_polban".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold10Indigo900bf,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 5,
                    top: 5,
                  ),
                  child: Text(
                    "lbl_1_jam_lalu".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold10Black9004c,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
