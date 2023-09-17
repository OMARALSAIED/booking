import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';
import '../Customs/Booknumber.dart';
import '../Customs/ButtonNibreHud.dart';

class BookingNawa extends StatelessWidget {
  const BookingNawa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dcolor,
      body: Column(children: [
        SizedBox(
          height: 60,
        ),
        Text(
          "نوى",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            BookNumberincity(
              text1: "66",
            ),
            Flexible(
              child: BookNumberincity(
                text1: "عددالطلاب",
              ),
            )
          ],
        ),
        SizedBox(
          height: 100,
        ),
        ButtonNebirehud(
          ontap: () {
            Navigator.of(context).pushNamed("First");
          },
          text: "22  الحي الشرقي",
        ),
        ButtonNebirehud(
          ontap: () {
            Navigator.of(context).pushNamed("Scand");
          },
          text: "33  الحي الغربي",
        ),
        ButtonNebirehud(
          ontap: () {
            Navigator.of(context).pushNamed("thared");
          },
          text: "55  الحي الشمالي",
        ),
        ButtonNebirehud(
          ontap: () {
            Navigator.of(context).pushNamed("forth");
          },
          text: "78  الحي الجنوبي",
        ),
      ]),
    );
  }
}
