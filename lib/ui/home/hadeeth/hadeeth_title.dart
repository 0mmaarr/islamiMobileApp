import 'package:flutter/material.dart';
import 'package:islami/ui/hadeeth_details/hadeeth_details.dart';

import '../../../theme/MyTheme.dart';
import 'hadeeth_tab.dart';

class HadeethTitle extends StatelessWidget {
  Hadeeth hadeeth;

  HadeethTitle(this.hadeeth);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadeethDetailsScreen.routeName,
                    arguments: hadeeth);
              },
              child: Text(hadeeth.title,
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center)),
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
