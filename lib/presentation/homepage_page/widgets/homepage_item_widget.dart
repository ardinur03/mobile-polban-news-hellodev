import '../controller/homepage_controller.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';

class HomepageItemWidget extends StatelessWidget {
  final News news;

  HomepageItemWidget(this.news);

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
                  news.title,
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
                    news.brief_overview,
                    maxLines: null,
                    textAlign: TextAlign.justify,
                    style: AppStyle.txtInterMedium12,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 8,
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
        ],
      ),
    );
  }
}
