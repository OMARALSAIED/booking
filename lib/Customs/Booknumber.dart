import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookNumberincity extends StatelessWidget {
  const BookNumberincity({
    super.key,
    required this.text1,
  });
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Text(
          text1,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
