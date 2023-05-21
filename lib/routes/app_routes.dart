import 'package:polban_news/presentation/detail_news_page/detail_news_screen.dart';
import 'package:polban_news/presentation/splash_screen/splash_screen.dart';
import 'package:polban_news/presentation/splash_screen/binding/splash_binding.dart';
import 'package:polban_news/presentation/homepage_container_screen/homepage_container_screen.dart';
import 'package:polban_news/presentation/homepage_container_screen/binding/homepage_container_binding.dart';
import 'package:polban_news/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:polban_news/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:polban_news/presentation/detail_news_page/binding/detail_news_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String homepagePage = '/homepage_page';

  static const String homepageContainerScreen = '/homepage_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String filterPage = '/filter_page';

  static String initialRoute = '/initialRoute';

  static const String detailNewsPage = '/detail-news';

  static const String bookmarkPage = '/bookmark-page';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: homepageContainerScreen,
      page: () => HomepageContainerScreen(),
      bindings: [
        HomepageContainerBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: detailNewsPage,
      page: () => DetailNewsScreen(news: Get.arguments),
      bindings: [
        DetailNewsBinding(),
      ],
    ),
  ];
}
