import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class ButtonNebirehud extends StatelessWidget {
  const ButtonNebirehud({
    super.key,
    required this.text,
    required this.ontap,
  });
  final VoidCallback ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: 24, left: 16, top: 20),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          height: 60,
          width: 350,
          decoration: BoxDecoration(
              color: Hcolor, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
