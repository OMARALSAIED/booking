import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:booking/Customs/CustomTextFiled.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/auth/vaild.dart';
import 'package:booking/main.dart';


import 'package:flutter/material.dart';

import '../Customs/CustomButton.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _GetStartedState();
}

class _GetStartedState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();
  bool isLoading = false;
  Crud crud = Crud();
  bool isAdmin = false;
  final TextEditingController idnui = TextEditingController();
  final TextEditingController password = TextEditingController();

  login() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await crud
          .postRequest(linkLogin, {"idnui": idnui.text, "phon": password.text});
      isLoading = false;
      setState(() {});
      if (response['status'] == 'Success') {
        sharedPref.setString("id", response['data']['id'].toString());
        sharedPref.setString("idnui", response['data']['idnui'].toString());
        sharedPref.setString("phon", response['data']['phon'].toString());
       
        
          Navigator.of(context).pushReplacementNamed("${AorU()}");
        
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تنبيه',
          desc: 'الرقم الجامعي أو كلمة المرور خطأ',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        )..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Form(
          key: formstate,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/bus.png")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Column(
                  children: [
                    CustomTextFiled(
                        valid: (val) {
                          return VaildInput(val!, 7, 50);
                        },
                        mycontroller: idnui,
                        hint: "Id",
                        icon: Icon(Icons.email)),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFiled(
                        valid: (val) {
                          return VaildInput(val!, 7, 50);
                        },
                        mycontroller: password,
                        hint: "password",
                        icon: Icon(Icons.password)),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        height: 50,
                        width: 200,
                        child: CustomButton(
                          onpress: () async {
                            await login();
                          },
                          text: "تسجيل الدخول",
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
