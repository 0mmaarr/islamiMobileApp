import 'package:flutter/material.dart';
import 'package:islami/theme/MyTheme.dart';
import 'package:islami/ui/chapter_details/chapter_details.dart';
import 'package:islami/ui/hadeeth_details/hadeeth_details.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetails.routeName: (_) => ChapterDetails(),
        HadeethDetailsScreen.routeName: (_) => HadeethDetailsScreen()
      },
      theme: MyThemeData.lightTheme,
    );
  }
}
