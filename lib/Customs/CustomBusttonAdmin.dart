import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonAdminPage extends StatelessWidget {
  const CustomButtonAdminPage({
    super.key,
    required this.ontap,
    required this.text, 
  });
  final VoidCallback ontap;
  final String text;
 
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        height: 55,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff009D99))),
            onPressed: ontap,
            child: Text(
              text,
              style: TextStyle(fontSize: 25),
            )));
  }
}
