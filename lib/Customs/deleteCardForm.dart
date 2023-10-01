import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';

class deleteCardForm extends StatelessWidget {
  const deleteCardForm({
    super.key,
    required this.name,
  });
  final String name;

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
                style: TextStyle(
                    fontSize: 15, color: Black, fontWeight: FontWeight.bold),
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
