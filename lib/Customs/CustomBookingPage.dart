import 'package:booking/Customs/Booknumber.dart';
import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';

class CustomBookingPage extends StatelessWidget {
  const CustomBookingPage({
    super.key,
    required this.name,
    required this.number,
  });
  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Scaffold(
        backgroundColor: Hcolor,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45),
              child: Center(
                child: Text(
                  "الحي الغربي",
                  style: TextStyle(fontSize: 35, color: Wihte),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  BookNumberincity(text1: "$number"),
                  BookNumberincity(text1: "عدد الطلاب")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.topCenter,
              child: Text(
                "$name",
                style: TextStyle(fontSize: 25),
              ),
              height: 500,
              width: 350,
              decoration: BoxDecoration(
                  color: Wihte, borderRadius: BorderRadius.circular(10)),
            )
          ]),
        ),
      ),
    );
  }
}
