import 'package:flutter/material.dart';

class SeccessCustomBookingCard extends StatelessWidget {
  const SeccessCustomBookingCard({
    super.key,
    required this.name,
    required this.time,
    required this.bookingtime,
  });
  final String bookingtime;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                bookingtime,
                style: TextStyle(fontSize: 20),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                " : وقت الرحلة الساعة",
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
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                ": اسم الطالب",
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
              Text(
                time,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                ": وقت الحجز",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
