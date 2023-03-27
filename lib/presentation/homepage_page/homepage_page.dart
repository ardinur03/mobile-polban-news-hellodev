// ignore_for_file: unused_import

import '../homepage_page/widgets/homepage_item_widget.dart';
import 'controller/homepage_controller.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/widgets/app_bar/custom_app_bar.dart';
import 'package:polban_news/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class HomepagePage extends StatelessWidget {
  final controller = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
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
              svgPath: ImageConstant.imgNotification,
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
        body: SizedBox(
          width: size.width,
          child: RefreshIndicator(
            onRefresh: () async {
              controller.refreshNews();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: getPadding(
                  left: 10,
                  top: 10,
                  right: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          height: 25,
                          width: 106,
                          text: "lbl_semua".tr,
                        ),
                        CustomButton(
                          height: 25,
                          width: 106,
                          text: "lbl_pusat".tr,
                          margin: getMargin(
                            left: 11,
                          ),
                          variant: ButtonVariant.OutlineBlue200_1,
                        ),
                        CustomButton(
                          height: 25,
                          width: 106,
                          text: "lbl_himpunan".tr,
                          margin: getMargin(
                            left: 11,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: getVerticalSize(
                        230.00,
                      ),
                      width: getHorizontalSize(
                        340.00,
                      ),
                      margin: getMargin(
                        top: 15,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgImagepicture,
                            height: getVerticalSize(
                              230.00,
                            ),
                            width: getHorizontalSize(
                              340.00,
                            ),
                            radius: BorderRadius.circular(
                              getHorizontalSize(
                                10.00,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: getHorizontalSize(
                                315.00,
                              ),
                              margin: getMargin(
                                bottom: 17,
                              ),
                              child: Text(
                                "msg_politeknik_negeri".tr,
                                maxLines: null,
                                textAlign: TextAlign.justify,
                                style: AppStyle.txtInterBold18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_terbaru".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterSemiBold10,
                              ),
                              Container(
                                height: getVerticalSize(
                                  1.00,
                                ),
                                width: getHorizontalSize(
                                  90.00,
                                ),
                                margin: getMargin(
                                  top: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.indigoA200,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_terpopuler".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular10,
                              ),
                              Container(
                                height: getVerticalSize(
                                  1.00,
                                ),
                                width: getHorizontalSize(
                                  90.00,
                                ),
                                margin: getMargin(
                                  top: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.blue200,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_paling_disukai".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular10,
                              ),
                              Container(
                                height: getVerticalSize(
                                  1.00,
                                ),
                                width: getHorizontalSize(
                                  90.00,
                                ),
                                margin: getMargin(
                                  top: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.blue200,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 13,
                      ),
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollEndNotification) {
                            if (controller
                                    .scrollController.position.extentAfter ==
                                0) {
                              controller.loadMoreNews(); // memuat data tambahan
                            }
                          }
                          return true;
                        },
                        child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    20.00,
                                  ),
                                );
                              },
                              itemCount: controller.news.length,
                              itemBuilder: (context, index) {
                                final newsModel = controller.news[index];
                                return HomepageItemWidget(newsModel);
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
