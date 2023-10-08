import 'package:avatar_glow/avatar_glow.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:booking/Customs/color.dart';
import 'package:booking/Customs/customBookbutton.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/main.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Bookginpage extends StatefulWidget {
  Bookginpage({super.key, required});

  @override
  State<Bookginpage> createState() => _BookginpageState();
}

class _BookginpageState extends State<Bookginpage> {
  Crud crud = Crud();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController Booktime = TextEditingController();
  TextEditingController cityid = TextEditingController();
  TextEditingController Name = TextEditingController();

  bool isLoagding = false;

  addBook() async {
    if (formstate.currentState!.validate()) {
      isLoagding = true;
      setState(() {});
      var response = await crud.postRequest(linkaddbook, {
        "booktime": Booktime.text,
        "user_id": sharedPref.getString("id"),
      });

      isLoagding = false;

      if (response["status"] == ["success"]) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تم الحجز بنجاح',
        )..show();
      } else {}
    }
  }

  final List<String> items = [
    '7 AM',
    '12:30 PM',
    '2:30 PM',
    '4 PM',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Black,
            body: isLoagding == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Form(
                    key: formstate,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "احجز الان",
                          style: TextStyle(fontSize: 45, color: Hcolor),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AvatarGlow(
                          glowColor: Hcolor,
                          endRadius: 100,
                          duration: Duration(milliseconds: 2500),
                          repeat: true,
                          showTwoGlows: true,
                          repeatPauseDuration: Duration(milliseconds: 150),
                          child: Material(
                            elevation: 5,
                            shape: CircleBorder(
                              side: BorderSide(width: 0.5, color: Hcolor),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Black,
                              child: Image.asset("assets/bus.png"),
                              radius: 50,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                      color: Black,
                                      borderRadius: BorderRadius.circular(20))),
                              isExpanded: true,
                              hint: Text(
                                'أختر وقت ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Hcolor,
                                ),
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value;
                                  switch (selectedValue) {
                                    case "7 AM":
                                      Booktime.text = "7 AM";
                                      break;
                                    case "12:30 PM":
                                      Booktime.text = "12:30 PM";
                                      break;

                                    case "2:30 PM":
                                      Booktime.text = "2:30 PM";
                                      break;
                                    case "4 PM":
                                      Booktime.text = "4 PM";
                                      break;
                                  }
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 190,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 115),
                            child: Row(
                              children: [
                                CustomBookbutton(
                                  onTap: () async {
                                    if (selectedValue != null) {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.info,
                                        animType: AnimType.rightSlide,
                                        title: "هل تريد تأكيد الحجز",
                                        btnOkOnPress: () {
                                          setState(() {
                                            addBook();

                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    "AfterBook",
                                                    (route) => false);
                                          });
                                        },
                                        btnCancelOnPress: () {},
                                      )..show();
                                    } else {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.info,
                                        animType: AnimType.rightSlide,
                                        title: " الرجاء اختيار الوقت ",
                                        btnOkOnPress: () {},
                                      )..show();
                                    }
                                  },
                                  text: "احجز",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )));
  }
}
