import 'package:booking/Customs/CustomBusttonAdmin.dart';
import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';

class UniyvercityHome extends StatelessWidget {
  const UniyvercityHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Black,
        body: SafeArea(
          child: Column(children: [
            Center(
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset(
                      "assets/uniy.png",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: 50,
                ),
                CustomButtonAdminPage(
                    ontap: () {
                      Navigator.of(context).pushNamed("QPU");
                    },
                    text: "جامعة قاسيون"),
                SizedBox(
                  height: 10,
                ),
                CustomButtonAdminPage(
                    ontap: () {
                      Navigator.of(context).pushNamed("EPU");
                    },
                    text: "جامعة اليرموك"),
                SizedBox(
                  height: 10,
                ),
                CustomButtonAdminPage(
                    ontap: () {
                      Navigator.of(context).pushNamed("SPU");
                    },
                    text: "الجامعة السورية"),
                SizedBox(
                  height: 10,
                ),
                CustomButtonAdminPage(
                    ontap: () {
                      Navigator.of(context).pushNamed("RSH");
                    },
                    text: "جامعة الرشيد"),
                SizedBox(
                  height: 10,
                ),
                CustomButtonAdminPage(
                    ontap: () {
                      Navigator.of(context).pushNamed("IUST");
                    },
                    text: "الجامعة الدولية "),
                SizedBox(
                  height: 10,
                ),
                CustomButtonAdminPage(
                    ontap: () {
                      Navigator.of(context).pushNamed("ARABIC");
                    },
                    text: "الجامعة العربية"),
              ]),
            )
          ]),
        ));
  }
}
