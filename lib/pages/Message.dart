import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Black,
      body: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "رسائل الإلغاء",
              style: TextStyle(fontSize: 40, color: Wihte),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                  color: Wihte, borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
