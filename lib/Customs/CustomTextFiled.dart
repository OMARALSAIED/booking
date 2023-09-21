import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFiled extends StatelessWidget {
  final TextEditingController mycontroller;
  final String hint;
  final Icon icon;

  CustomTextFiled({
    super.key,
    required this.hint,
    required this.icon,
    this.valid,
    this.onSaved,
    required this.mycontroller,
  });

  final String? Function(String?)? valid;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 3,
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(1, 1))
          ]),
      height: 55,
      width: 350,
      child: TextFormField(
        controller: mycontroller,
        onSaved: onSaved,
        validator: valid,
        scrollPadding: EdgeInsets.only(bottom: 100),
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(15)),
            filled: true),
      ),
    );
  }
}
