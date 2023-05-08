import 'controller/homepage_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/presentation/homepage_page/homepage_page.dart';
import 'package:polban_news/widgets/custom_bottom_bar.dart';
import 'package:polban_news/presentation/filter_page/filter_page.dart';
import 'package:polban_news/presentation/bookmark_page/bookmark_page.dart';

class HomepageContainerScreen extends GetWidget<HomepageContainerController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.homepagePage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })));
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homepagePage;
      case BottomBarEnum.Filter:
        return AppRoutes.filterPage;
      case BottomBarEnum.Bookmark:
        return AppRoutes.bookmarkPage;
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homepagePage:
        return HomepagePage();
      case AppRoutes.filterPage:
        return FilterPage();
      case AppRoutes.bookmarkPage:
        return BookmarkPage();
      default:
        return DefaultWidget();
    }
  }
}
