import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';
import '../Customs/Booknumber.dart';
import '../Customs/ButtonNibreHud.dart';

class BookingGarrfa extends StatelessWidget {
  const BookingGarrfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Black,
      body: Column(children: [
        SizedBox(
          height: 60,
        ),
        Text(
          "قرفا",
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
            BookNumberincity(
              text1: "عدد الطلاب",
            )
          ],
        ),
        SizedBox(
          height: 100,
        ),
        ButtonNebirehud(
          ontap: () {
            Navigator.of(context).pushNamed("FirstGr");
          },
          text: "22  الحي الشرقي",
        ),
        ButtonNebirehud(
          ontap: () {
            Navigator.of(context).pushNamed("SecoundGr");
          },
          text: "33  الحي الغربي",
        ),
        ButtonNebirehud(
          ontap: () {
            Navigator.of(context).pushNamed("ThaerdGR");
          },
          text: "55  الحي الشمالي",
        ),
        ButtonNebirehud(
          ontap: () {
            Navigator.of(context).pushNamed("ForthGR");
          },
          text: "78  الحي الجنوبي",
        ),
      ]),
    );
  }
}
