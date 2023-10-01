import 'package:booking/Customs/CustomTextFiled.dart';
import 'package:booking/Customs/color.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/auth/vaild.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../Customs/customText.dart';

class Addusers extends StatefulWidget {
  const Addusers({super.key});

  @override
  State<Addusers> createState() => _AddusersState();
}

class _AddusersState extends State<Addusers> {
  GlobalKey<FormState> formstate = GlobalKey();

  Crud _crud = Crud();
  final TextEditingController idnui = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  bool isLoading = false;
  final TextEditingController uniname = TextEditingController();
  final TextEditingController phon = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController district = TextEditingController();

  signUp() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await _crud.postRequest(linkSignUp, {
        "idnui": idnui.text,
        "fullname": fullname.text,
        "uniname": uniname.text,
        "phon": phon.text,
        "city": city.text,
        "district": district.text
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == 'success') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تم إنشاء الحساب بنجاح',
          desc: 'يرجى تسجيل الدخول',
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            setState(() {});
          },
        )..show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'الحساب موجود بالفعل',
          desc: 'يرجى تسجيل الدخول',
          btnOkOnPress: () {
            setState(() {});
          },
        )..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(children: [
              Form(
                key: formstate,
                child: Column(children: [
                  customText(
                    text: "إضافة مشترك جديد",
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Wihte, borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.person,
                      color: Hcolor,
                      size: 70,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 7, 20);
                      },
                      mycontroller: idnui,
                      hint: "الرقم الحامعي",
                      icon: Icon(Icons.numbers)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 5, 50);
                      },
                      mycontroller: fullname,
                      hint: "الإسم الكامل",
                      icon: Icon(Icons.person)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 4, 50);
                      },
                      mycontroller: uniname,
                      hint: "اسم الجامعة",
                      icon: Icon(Icons.numbers)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 7, 30);
                      },
                      mycontroller: phon,
                      hint: "رقم الهاتف",
                      icon: Icon(Icons.person)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 3, 30);
                      },
                      mycontroller: city,
                      hint: "المدينة",
                      icon: Icon(Icons.person)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 5, 30);
                      },
                      mycontroller: district,
                      hint: "الحي",
                      icon: Icon(Icons.person)),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Hcolor, borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () async {
                        var response = await signUp();
                        if (response['status'] == ['success']) {
                          Navigator.of(context).pushReplacementNamed("Adduers");
                        }
                      },
                      child: Text(
                        "إضافة",
                        style: TextStyle(fontSize: 30, color: Wihte),
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
