import 'package:flutter/material.dart';

class success extends StatelessWidget {
  const success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(
          child: Text(
            "تم إنشاءالحساب بنجاح",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        )
      ]),
    );
  }
}
