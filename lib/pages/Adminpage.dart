import 'package:booking/Customs/DropDownButton.dart';
import 'package:booking/Customs/color.dart';
import 'package:booking/Customs/customText.dart';

import 'package:flutter/material.dart';

import '../Customs/CustomBusttonAdmin.dart';

// ignore: must_be_immutable
class Adminpage extends StatefulWidget {
  Adminpage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  State<Adminpage> createState() => _AdminpageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Black,
      body: ListView(children: [
        Column(children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            width: 500,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Hcolor),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      "صفحة المشرف",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                  Container(
                      width: 300,
                      height: 200,
                      child: Image.asset("assets/bus.png"))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          customText(
            text: "إطلاع على الحجوزات",
          ),
          DropDownButton(),
          SizedBox(
            height: 30,
          ),
          CustomButtonAdminPage(
            text: "الطلاب المشتركين",
            ontap: () {
              Navigator.of(context).pushNamed("Allusers");
            },
          ),
        ]),
      ]),
    );
  }
}
