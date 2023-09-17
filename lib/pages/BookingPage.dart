import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:booking/Customs/color.dart';
import 'package:booking/Customs/customBookbutton.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';

import 'package:booking/main.dart';
import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class Bookginpage extends StatefulWidget {
  Bookginpage({super.key});

  @override
  State<Bookginpage> createState() => _BookginpageState();
}

class _BookginpageState extends State<Bookginpage> {
  Crud crud = Crud();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController Booktime = TextEditingController();
  TextEditingController Name = TextEditingController();

  bool isLoagding = false;


  addBook() async {
    if (formstate.currentState!.validate()) {
      isLoagding = true;
      setState(() {});
      var response = await crud.postRequest(linkaddbook,
          {"booktime": Booktime.text, "user_id": sharedPref.getString("id")});
      isLoagding = false;
      setState(() {});
      if (response["status"] == ["Success"]) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تم الحجز بنجاح',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        )..show();
      } else {}
    }
  }

  final List<String> items = [
    '7',
    '12:30',
    '2:30',
    '4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      height: 220,
                    ),
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'أختر وقت ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                              switch (selectedValue) {
                                case "7":
                                  Booktime.text = "7";
                                  break;
                                case "12:30":
                                  Booktime.text = "12:30";
                                  break;

                                case "2:30":
                                  Booktime.text = "2:30";
                                  break;
                                case "4":
                                  Booktime.text = "4";
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
                      height: 150,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Row(
                          children: [
                            CustomBookbutton(
                              onTap: () async {
                                if (selectedValue != null) {
                                  addBook();

                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: "هل تريد تأكيد الحجز",
                                    btnOkOnPress: () {
                                    
                                      Navigator.of(context)
                                          .pushNamed("AfterBook");
                                    },
                                    btnCancelOnPress: () {},
                                  )..show();
                                } else {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    title: "الرجاء اختيار وقت",
                                    btnOkOnPress: () {},
                                  )..show();
                                }
                              },
                              text: "احجز",
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}