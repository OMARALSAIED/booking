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
  final TextEditingController iduni = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  bool isLoading = false;
  final TextEditingController uniname = TextEditingController();
  final TextEditingController phon = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController hood = TextEditingController();

  signUp() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await _crud.postRequest(linkSignUp, {
        "iduni": iduni.text,
        "fullname": fullname.text,
        "uniname": uniname.text,
        "phon": phon.text,
        "city": city.text,
        "hood": hood.text
      });
      isLoading = false;
      setState(() {});
      if (response['status'] == 'Success') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تم إنشاء الحساب بنجاح',
          desc: 'يرجى تسجيل الدخول',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        )..show();
      } else {
        print("signUp fail");
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
                    width: 150,
                    height: 100,
                    child: Icon(
                      Icons.person,
                      color: Hcolor,
                      size: 80,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 7, 20);
                      },
                      mycontroller: iduni,
                      hint: "الرقم الحامعي",
                      icon: Icon(Icons.numbers)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 3, 50);
                      },
                      mycontroller: fullname,
                      hint: "الإسم الكامل",
                      icon: Icon(Icons.person)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 3, 50);
                      },
                      mycontroller: uniname,
                      hint: "اسم الجامعة",
                      icon: Icon(Icons.numbers)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 7, 50);
                      },
                      mycontroller: phon,
                      hint: "رقم الهاتف",
                      icon: Icon(Icons.person)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 3, 50);
                      },
                      mycontroller: city,
                      hint: "المدينة",
                      icon: Icon(Icons.person)),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFiled(
                      valid: (val) {
                        return VaildInput(val!, 3, 50);
                      },
                      mycontroller: hood,
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
                        await signUp();
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
