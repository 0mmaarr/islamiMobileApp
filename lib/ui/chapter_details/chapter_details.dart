import 'package:flutter/material.dart';

import '../ui_utilize.dart';

class ChapterDetails extends StatelessWidget {
  static const String routeName = 'chapter-details';

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as DetailedChapterArgs;
    return Stack(children: [
      Image.asset(getFullPathImage('main_background.jpg')),
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(args.chapterTitle),
        ),
        body: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          margin: EdgeInsets.symmetric(vertical: 35, horizontal: 24),
          elevation: 40,
          child: ListView.builder(
            itemBuilder: (context, index) {
              Text('Details');
            },
            itemCount: 114,
          ),
        ),
      )
    ]);
  }
}

class DetailedChapterArgs {
  int chapterIndex;
  String chapterTitle;

  DetailedChapterArgs(this.chapterIndex, this.chapterTitle);
}
