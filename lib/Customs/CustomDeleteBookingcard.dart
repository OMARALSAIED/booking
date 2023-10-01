import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDeleteBookingCard extends StatelessWidget {
  CustomDeleteBookingCard({
    super.key,
    required this.name,
    required this.time,
    required this.onTap,
  });
  final String name;
  final String time;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
       
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 25),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100)),
                  child: InkWell(
                      onTap: onTap,
                      child: Icon(
                        Icons.delete,
                        size: 30,
                      )),
                ),
              ),
              Spacer(
                flex: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                ": اسم الطالب",
                style: TextStyle(fontSize: 15),
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
                time,
                style: TextStyle(fontSize: 20),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                "وقت الحجز : الساعة",
                style: TextStyle(fontSize: 15),
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
