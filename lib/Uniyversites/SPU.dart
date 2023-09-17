import 'package:flutter/material.dart';

import '../Customs/Booknumber.dart';
import '../Customs/color.dart';

class SPU extends StatelessWidget {
  const SPU({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hcolor,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 90,
          ),
          Center(
            child: Text(
              "الجامعة السورية",
              style: TextStyle(fontSize: 35, color: Wihte),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                BookNumberincity(text1: "2"),
                BookNumberincity(text1: "عدد الطلاب")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.topCenter,
            child: Text(
              "omar \n sallem",
              style: TextStyle(fontSize: 25),
            ),
            height: 500,
            width: 350,
            decoration: BoxDecoration(
                color: Wihte, borderRadius: BorderRadius.circular(10)),
          )
        ]),
      ),
    );
  }
}
