import '../controller/homeguest_controller.dart';
import '../models/homeguest_item_model.dart';
import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';

// ignore: must_be_immutable
class HomeguestItemWidget extends StatelessWidget {
  HomeguestItemWidget(this.homeguestItemModelObj);

  HomeguestItemModel homeguestItemModelObj;

  var controller = Get.find<HomeguestController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 8,
        top: 4,
        right: 8,
        bottom: 4,
      ),
      decoration: AppDecoration.fillBluegray100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgTitleimage,
                height: getVerticalSize(
                  75.00,
                ),
                width: getHorizontalSize(
                  130.00,
                ),
                margin: getMargin(
                  top: 2,
                  bottom: 1,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "lbl_info_ukt".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterBold10Black900,
                  ),
                  Container(
                    width: getHorizontalSize(
                      175.00,
                    ),
                    margin: getMargin(
                      top: 4,
                    ),
                    child: Text(
                      "msg_lorem_ipsum_dolor".tr,
                      maxLines: null,
                      textAlign: TextAlign.justify,
                      style: AppStyle.txtInterRegular8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: getPadding(
              top: 1,
              right: 71,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_1_jam_lalu".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterMedium8Black9007f,
                ),
                Text(
                  "msg_oleh_admin_pusat".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterMedium8Black9007f,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
