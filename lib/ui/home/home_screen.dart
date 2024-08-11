import 'package:flutter/material.dart';
import 'package:islami/theme/MyTheme.dart';
import 'package:islami/ui/home/hadeeth/hadeeth_tab.dart';
import 'package:islami/ui/home/quran/quran_tab.dart';
import 'package:islami/ui/home/radio/radio_tab.dart';
import 'package:islami/ui/home/tasbeeh/sebha_tab.dart';
import 'package:islami/ui/ui_utilize.dart';
import 'package:islami/ui/ui_utilize.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(getFullPathImage('main_background.jpg')),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "islami",
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.radio),
                  label: 'radio',
                  backgroundColor: MyThemeData.lightPrimary),
              BottomNavigationBarItem(
                  icon: Icon(Icons.circle_outlined), label: 'sebha'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_rounded), label: 'hadeeth'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined), label: 'quran'),
            ],
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  var tabs = [RadioTab(), SebhaTab(), HadethTab(), QuranTab()];
}
