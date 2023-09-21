import 'package:flutter/cupertino.dart';

class customText extends StatelessWidget {
  const customText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 30, color: Color(0xff009D99)),
    );
  }
}
