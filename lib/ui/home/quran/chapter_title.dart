import 'package:flutter/material.dart';
import 'package:islami/ui/chapter_details/chapter_details.dart';

import '../../../theme/MyTheme.dart';

class ChapterTitle extends StatelessWidget {
  String title;
  int numofAya;
  int suratarteb;

  ChapterTitle(this.title, this.numofAya, this.suratarteb);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ChapterDetails.routeName,
                    arguments:
                        DetailedChapterArgs(numofAya, title, suratarteb));
              },
              child: Text(title,
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center)),
        ),
        Container(
          height: 50,
          width: 2,
          color: MyThemeData.lightPrimary,
        ),
        Expanded(
          child: Text('$numofAya',
              style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
