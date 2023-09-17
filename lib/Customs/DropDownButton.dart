import 'package:booking/Customs/color.dart';
import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key });



  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  var selectv = "نوى";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton(
        alignment: Alignment.center,
        dropdownColor: Hcolor,
        style: TextStyle(fontSize: 20, color: Wihte),
        items: ["نوى", "الشيخ مسكين", "قرفا"]
            .map((e) => DropdownMenuItem(
                  child: Text("$e"),
                  value: e,
                ))
            .toList(),
        onChanged: (val) {
          setState(() {
            selectv = val!;
            if (selectv == "نوى") {
              Navigator.of(context).pushNamed("BookingNawa");
            } else if (selectv == "الشيخ مسكين") {
              Navigator.of(context).pushNamed("Bookingchaak");
            } else {
              Navigator.of(context).pushNamed("BookingGarrfa");
            }
          });
        },
        value: selectv,
      ),
    );
  }
}
