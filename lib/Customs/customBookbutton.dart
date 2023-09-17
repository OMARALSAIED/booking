import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';

class CustomBookbutton extends StatelessWidget {
  const CustomBookbutton({
    required this.text,
    super.key, this.onTap,
  });
  final void Function()? onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
          alignment: Alignment.center,
          width: 180,
          height: 60,
          decoration: BoxDecoration(
              color: Hcolor, borderRadius: BorderRadius.circular(12)),
          child: Text(
            text,
            style: TextStyle(fontSize: 35, color: Wihte),
          )),
    );
  }
}
