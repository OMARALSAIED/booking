import 'package:booking/Customs/Booknumber.dart';
import 'package:booking/Customs/color.dart';

import 'package:flutter/material.dart';

class DeletPage extends StatelessWidget {
  const DeletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Black,
      body: Column(children: [
        SizedBox(
          height: 60,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "اختر الطالب الذي تريد إزالته",
            style: TextStyle(fontSize: 35, color: Wihte),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: BookNumberincity(text1: "200"),
            ),
            Flexible(
              child: BookNumberincity(text1: "عددالطلاب"),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.topCenter,
          child: Text(
            "Harere\nomar\nsallem\n",
            style: TextStyle(fontSize: 25),
          ),
          height: 500,
          width: 380,
          decoration: BoxDecoration(
              color: Wihte, borderRadius: BorderRadius.circular(10)),
        )
      ]),
    );
  }
}
