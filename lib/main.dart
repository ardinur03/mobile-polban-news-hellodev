import 'package:flutter/material.dart';
import 'package:polban_news/pages/splash_page.dart';
import 'package:polban_news/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
