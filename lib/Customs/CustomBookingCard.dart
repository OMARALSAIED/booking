
import 'package:flutter/material.dart';

class CustomBookingCard extends StatelessWidget {
  const CustomBookingCard({
    super.key,
    required this.name,
    required this.time,
  
  });
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
