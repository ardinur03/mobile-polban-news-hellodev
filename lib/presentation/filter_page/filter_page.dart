import 'package:flutter/material.dart';
import 'package:polban_news/widgets/app_bar/custom_app_bar.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/presentation/filter_page/controller/filter_controller.dart';
import '../homepage_page/widgets/homepage_item_widget.dart';

class FilterPage extends StatelessWidget {
  final controller = Get.put(FilterController());

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
            Container(
              margin: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onSubmitted: (value) {
                  // Lakukan pencarian ketika form di-submit
                  controller.queryNews(value);
                },
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
