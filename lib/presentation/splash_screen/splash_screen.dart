import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.blue700,
            body: Container(
                width: size.width,
                padding: getPadding(left: 54, right: 54),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLogopolban,
                          height: getVerticalSize(97.00),
                          width: getHorizontalSize(267.00),
                          margin: getMargin(bottom: 1))
                    ]))));
  }
}
