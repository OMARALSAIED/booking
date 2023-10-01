import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllusersCard extends StatelessWidget {
   AllusersCard({
    super.key,
    required this.name,
    required this.phon,
    required this.uniname,
    required this.city,
    required this.hood,
    required this.onTap,
  });
  final String phon;
  final String name;
  final String uniname;
  final String city;
  final String hood;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Hcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                " : اسم الطالب",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 20,
              ),
              Text(
                phon,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                " : الرقم",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 10,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100)),
                child: InkWell(
                  onTap:onTap ,
                    child: Icon(
                  Icons.delete,
                  size: 30,
                )),
              ),
              Spacer(
                flex: 25,
              ),
              Text(
                uniname,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                " : اسم الجامعة",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 20,
              ),
              Text(
                city,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                " : المدينة",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 20,
              ),
              Text(
                hood,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                " : الحي",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
