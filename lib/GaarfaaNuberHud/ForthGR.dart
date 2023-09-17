import 'package:booking/Customs/Booknumber.dart';
import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';

class ForthGR extends StatelessWidget {
  const ForthGR({super.key});

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
                "الحي الجنوبي",
                style: TextStyle(fontSize: 35, color: Wihte),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                BookNumberincity(text1: "3"),
                BookNumberincity(text1: "عدد الطلاب")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.topCenter,
            child: Text(
              "grfa",
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
