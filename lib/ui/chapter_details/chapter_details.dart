import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/theme/MyTheme.dart';
import 'package:islami/ui/chapter_details/verse_content.dart';

import '../ui_utilize.dart';

class ChapterDetails extends StatefulWidget {
  static const String routeName = 'chapter-details';

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as DetailedChapterArgs;

    void readFileData(int fileIndex) async {
      String fileContent =
          await rootBundle.loadString("assets/files/${fileIndex}.txt");
      List<String> lines = fileContent.trim().split('\n');
      setState(() {
        verses = lines;
      });
    }

    if (verses.isEmpty) {
      readFileData(args.suratarteb);
    }

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
            child: verses.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return VerseContent(verses[index], index);
                    },
                    itemCount: verses.length,
                    separatorBuilder: (context, index) => Container(
                          height: 1,
                          width: double.infinity,
                          color: MyThemeData.lightPrimary,
                          margin: EdgeInsets.symmetric(horizontal: 64),
                        ))
                : Center(child: CircularProgressIndicator())),
      )
    ]);
  }
}

class DetailedChapterArgs {
  int chapterIndex;
  String chapterTitle;
  int suratarteb;

  DetailedChapterArgs(this.chapterIndex, this.chapterTitle, this.suratarteb);
}
