import 'package:flutter/material.dart';
import 'package:polban_news/widgets/app_bar/custom_app_bar.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/presentation/filter_page/controller/filter_controller.dart';
import '../homepage_page/widgets/homepage_item_widget.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final controller = Get.put(FilterController());
  String _filter = 'Terbaru';

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
        body: Column(
          children: [
            Padding(
              padding: getPadding(
                top: 30,
                left: 20,
                right: 20,
                bottom: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _filter = 'Terbaru';
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Boomark',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular10,
                        ),
                        Container(
                          height: getVerticalSize(5.00),
                          width: getHorizontalSize(90.00),
                          margin: getMargin(top: 3),
                          decoration: BoxDecoration(
                            color: _filter == 'Terbaru'
                                ? ColorConstant.indigoA200
                                : ColorConstant.blue200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _filter = 'Terpopuler';
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Disukai',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular10,
                        ),
                        Container(
                          height: getVerticalSize(5.00),
                          width: getHorizontalSize(90.00),
                          margin: getMargin(top: 3),
                          decoration: BoxDecoration(
                            color: _filter == 'Terpopuler'
                                ? ColorConstant.indigoA200
                                : ColorConstant.blue200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _filter = 'Paling Disukai';
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Terakhir Dilihat',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular10,
                        ),
                        Container(
                          height: getVerticalSize(5.00),
                          width: getHorizontalSize(90.00),
                          margin: getMargin(top: 3),
                          decoration: BoxDecoration(
                            color: _filter == 'Paling Disukai'
                                ? ColorConstant.indigoA200
                                : ColorConstant.blue200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
