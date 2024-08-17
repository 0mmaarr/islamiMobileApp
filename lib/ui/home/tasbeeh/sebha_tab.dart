import 'package:flutter/material.dart';

import '../../../theme/MyTheme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  int i = 0;
  double rotationAngle = 45;

  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedRotation(
            duration: Duration(seconds: 1),
            turns: (rotationAngle + 45) / 36,
            child: Image.asset('assets/images/body of seb7a.png')),
      ),
      Text(
        'عدد التسبيحات',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
      Container(
        child: Text(
          '$i',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        //color: MyThemeData.lightPrimary,
        alignment: Alignment.center,
        height: 100,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: MyThemeData.lightPrimary),
      ),
      InkWell(
        onTap: () {
          i++;

          setState(() {
            rotationAngle++;
          });
        },
        child: Container(
          child: Text(
            'سبحان الله',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          //color: MyThemeData.lightPrimary,
          alignment: Alignment.center,
          height: 80,
          width: 160,
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: MyThemeData.lightPrimary),
        ),
      )
    ]);
  }
}

