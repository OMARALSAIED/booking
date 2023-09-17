import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text, required this.onpress,
  });
  final VoidCallback onpress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black)),
        onPressed: onpress,
        child: Text(
          text,
          style: TextStyle(fontSize: 25),
        ));
  }
}
