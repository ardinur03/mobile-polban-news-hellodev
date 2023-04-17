// ignore_for_file: must_be_immutable

import '../controller/homepage_controller.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/presentation/detail_news_page/detail_news_screen.dart';

class HomepageItemWidget extends StatelessWidget {
  final News news;
  final HomepageController homepageController = Get.find();

  var controller = Get.find<HomepageController>();

  HomepageItemWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailNewsScreen(news: news),
          ),
        );
      },
      child: Container(
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
            Padding(
              padding: getPadding(left: 14, top: 3),
              child: CustomImageView(
                url: news.galleries.isNotEmpty
                    ? news.galleries[0]
                    : 'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
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
            ),
            Expanded(
              child: Padding(
                padding: getPadding(
                  bottom: 8,
                  left: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterBold14LightblueA700,
                    ),
                    Container(
                      width: getHorizontalSize(
                        183.00,
                      ),
                      margin: getMargin(
                        top: 8,
                      ),
                      child: Text(
                        news.brief_overview,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: AppStyle.txtInterMedium12,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 12,
                      ),
                      child: Text(
                        'Oleh: ' + news.author,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterSemiBold10Indigo900bf,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 5,
                      ),
                      child: Text(
                        '• ' + news.created_at,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterSemiBold10Black9004c,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
