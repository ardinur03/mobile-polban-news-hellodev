import '../homeguest_page/widgets/homeguest_item_widget.dart';
import 'controller/homeguest_controller.dart';
import 'models/homeguest_item_model.dart';
import 'models/homeguest_model.dart';
import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/widgets/app_bar/custom_app_bar.dart';
import 'package:polban_news/widgets/custom_button.dart';
import 'package:polban_news/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class HomeguestPage extends StatelessWidget {
  HomeguestController controller =
      Get.put(HomeguestController(HomeguestModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            40.00,
          ),
          title: Padding(
            padding: getPadding(
              left: 12,
            ),
            child: Text(
              "lbl_polban_news".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterBlack18,
            ),
          ),
          actions: [
            CustomImageView(
              svgPath: ImageConstant.imgLightbulb,
              height: getSize(
                24.00,
              ),
              width: getSize(
                24.00,
              ),
              margin: getMargin(
                left: 13,
                top: 7,
                right: 13,
                bottom: 9,
              ),
            ),
          ],
          styleType: Style.bgFillWhiteA700,
        ),
        body: Container(
          padding: getPadding(
            all: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        100.00,
                      ),
                      padding: getPadding(
                        left: 28,
                        top: 13,
                        right: 28,
                        bottom: 13,
                      ),
                      decoration: AppDecoration.txtFillBlue700.copyWith(
                        borderRadius: BorderRadiusStyle.txtCustomBorderTL15,
                      ),
                      child: Text(
                        "lbl_pusat".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterMedium12,
                      ),
                    ),
                    CustomButton(
                      height: 25,
                      width: 100,
                      text: "lbl_himpunan".tr,
                    ),
                  ],
                ),
                CustomSearchView(
                  width: 330,
                  focusNode: FocusNode(),
                  controller: controller.group1337Controller,
                  hintText: "lbl_cari".tr,
                  margin: getMargin(
                    top: 15,
                  ),
                  prefix: Container(
                    margin: getMargin(
                      left: 11,
                      top: 8,
                      right: 13,
                      bottom: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          7.00,
                        ),
                      ),
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgSearch,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      30.00,
                    ),
                  ),
                ),
                Container(
                  height: getVerticalSize(
                    150.00,
                  ),
                  width: getHorizontalSize(
                    330.00,
                  ),
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgTitleimage,
                        height: getVerticalSize(
                          150.00,
                        ),
                        width: getHorizontalSize(
                          330.00,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            10.00,
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: getHorizontalSize(
                            212.00,
                          ),
                          margin: getMargin(
                            left: 11,
                            bottom: 13,
                          ),
                          child: Text(
                            "msg_politeknik_negeri".tr,
                            maxLines: null,
                            textAlign: TextAlign.justify,
                            style: AppStyle.txtInterBold10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: getHorizontalSize(
                          100.00,
                        ),
                        padding: getPadding(
                          left: 30,
                          top: 7,
                          right: 34,
                          bottom: 7,
                        ),
                        decoration: AppDecoration.txtFillBlue100.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder12,
                        ),
                        child: Text(
                          "lbl_terbaru".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterMedium8,
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          100.00,
                        ),
                        padding: getPadding(
                          left: 28,
                          top: 7,
                          right: 28,
                          bottom: 7,
                        ),
                        decoration: AppDecoration.txtFillBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder12,
                        ),
                        child: Text(
                          "lbl_terpopuler".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterMedium8,
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          100.00,
                        ),
                        padding: getPadding(
                          left: 22,
                          top: 7,
                          right: 22,
                          bottom: 7,
                        ),
                        decoration: AppDecoration.txtFillBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder12,
                        ),
                        child: Text(
                          "lbl_palling_disukai".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterMedium8,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 23,
                  ),
                  child: Obx(
                    () => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: getVerticalSize(
                            15.00,
                          ),
                        );
                      },
                      itemCount: controller
                          .homeguestModelObj.value.homeguestItemList.length,
                      itemBuilder: (context, index) {
                        HomeguestItemModel model = controller
                            .homeguestModelObj.value.homeguestItemList[index];
                        return HomeguestItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
