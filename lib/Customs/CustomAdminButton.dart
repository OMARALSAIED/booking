import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonA extends StatelessWidget {
  const CustomButtonA({
    super.key,
    required this.ontap, required this.text,
  });
  final VoidCallback ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 330,
        decoration: BoxDecoration(
            color: Color(0xff009D99), borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
