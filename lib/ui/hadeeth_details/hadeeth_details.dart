import 'package:flutter/material.dart';
import 'package:islami/ui/home/hadeeth/hadeeth_tab.dart';

import '../ui_utilize.dart';

class HadeethDetailsScreen extends StatelessWidget {
  static const String routeName = 'HadeethDetailsScreen';

  //const HadeethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Hadeeth hadeeth = ModalRoute.of(context)?.settings.arguments as Hadeeth;

    return Stack(children: [
      Image.asset(getFullPathImage('main_background.jpg')),
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(hadeeth.title),
        ),
        body: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            margin: EdgeInsets.symmetric(vertical: 35, horizontal: 24),
            elevation: 40,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Text(
                        hadeeth.content,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      )
    ]);
  }
}
