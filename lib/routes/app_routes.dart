import 'package:polban_news/presentation/splash_screen/splash_screen.dart';
import 'package:polban_news/presentation/splash_screen/binding/splash_binding.dart';
import 'package:polban_news/presentation/homeguest_container_screen/homeguest_container_screen.dart';
import 'package:polban_news/presentation/homeguest_container_screen/binding/homeguest_container_binding.dart';
import 'package:polban_news/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:polban_news/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String homeguestPage = '/homeguest_page';

  static const String homeguestContainerScreen = '/homeguest_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: homeguestContainerScreen,
      page: () => HomeguestContainerScreen(),
      bindings: [
        HomeguestContainerBinding(),
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
    )
  ];
}
