import 'package:booking/Customs/Booknumber.dart';
import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';

class thared extends StatelessWidget {
  const thared({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hcolor,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45),
            child: Center(
              child: Text(
                "الحي الشمالي",
                style: TextStyle(fontSize: 35, color: Wihte),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                BookNumberincity(text1: "1"),
                BookNumberincity(text1: "عدد الطلاب")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.topCenter,
            child: Text(
              "yasser",
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