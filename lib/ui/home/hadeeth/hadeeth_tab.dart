import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/hadeeth/hadeeth_title.dart';

import '../../../theme/MyTheme.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeeth> allHadeeth = [];

  @override
  void initState() {
    super.initState();
    readHadeethFile();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/hadith_header.png'),
        Container(
          width: double.infinity,
          height: 2,
          color: MyThemeData.lightPrimary,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              'Hadeeth Number',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        Container(
          width: double.infinity,
          height: 2,
          color: MyThemeData.lightPrimary,
        ),
        Expanded(
          child: allHadeeth.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return HadeethTitle(allHadeeth[index]);
                  },
                  itemCount: allHadeeth.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 2,
                      color: MyThemeData.lightPrimary,
                      margin: EdgeInsets.symmetric(horizontal: 64),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator()),
        )
      ],
    );
  }

  void readHadeethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> separatedAHadeeth = fileContent.split('#');
    for (int i = 0; i < separatedAHadeeth.length; i++) {
      String singleHadeeth = separatedAHadeeth[i];
      List<String> lines = singleHadeeth.trim().split('\n');
      String title = lines[0];
      lines.remove(0);
      String content = lines.join('\n');
      Hadeeth h = Hadeeth(title, content);
      allHadeeth.add(h);
    }
    setState(() {});
  }
}

class Hadeeth {
  String title;
  String content;

  Hadeeth(this.title, this.content);
}
