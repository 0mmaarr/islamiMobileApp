import 'package:flutter/material.dart';

import '../../../theme/MyTheme.dart';

class VerseContent extends StatelessWidget {
  String content;

  int index;

  VerseContent(this.content, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
              onTap: () {},
              child: Text(
                '$content {${index + 1}}',
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              )),
        ),
        Container(
          height: 50,
          width: 2,
          color: MyThemeData.lightPrimary,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
