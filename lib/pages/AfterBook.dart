import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:booking/Customs/MessageNotification.dart';
import 'package:booking/Customs/SeccessBookingCard.dart';
import 'package:booking/Customs/color.dart';
import 'package:booking/Customs/customBookbutton.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/main.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class AfterBook extends StatefulWidget {
  const AfterBook({super.key});

  @override
  State<AfterBook> createState() => _AfterBookState();
}

class _AfterBookState extends State<AfterBook> {
  Crud _crud = Crud();

  getbook() async {
    var response = await _crud
        .postRequest(linkviewbook, {"user_id": sharedPref.getString("id")});
    return response;
  }

  deleteBook() async {
    var response = await _crud
        .postRequest(linkdeleteBook, {"user_id": sharedPref.getString("id")});

    return response;
  }

  addNameDeletebook() async {
    var response = await _crud.postRequest(
        addNamedeleteBook, {"user_iddelet": sharedPref.getString("id")});
    return response;
  }

  NotificMessage notificMessage = NotificMessage();

  @override
  void initState() {
    super.initState();
    notificMessage.initialiseNotificatois();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Hcolor, actions: [
        IconButton(
            onPressed: () {
              sharedPref.clear();
              Navigator.of(context).pushReplacementNamed("Login");
            },
            icon: Icon(Icons.exit_to_app))
      ]),
      backgroundColor: Black,
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          FutureBuilder(
            future: getbook(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['status'] == 'Failed')
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Hello ",
                          style: TextStyle(fontSize: 50, color: Wihte),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "ليس لديك أي حجز حاليا",
                          style: TextStyle(fontSize: 30, color: Wihte),
                        ),
                        AvatarGlow(
                          glowColor: Colors.blue,
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
                              child: Icon(
                                Icons.favorite,
                                color: Hcolor,
                                size: 50,
                              ),
                              radius: 50,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Container(
                          width: 250,
                          height: 60,
                          child: CustomBookbutton(
                            text: "الرجوع للحجز",
                            onTap: () {
                              Navigator.of(context).pushNamed("BookingPage");
                            },
                          ),
                        )
                      ],
                    ),
                  );

                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Container(
                              width: 350,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: Hcolor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Text(
                                    "تم الحجز بنجاح",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  SeccessCustomBookingCard(
                                    name:
                                        "${snapshot.data['data'][i]['fullname']}",
                                    time: "${snapshot.data['data'][i]['hour']}",
                                    bookingtime:
                                        "${snapshot.data['data'][i]['booktime']}",
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          CustomBookbutton(
                            text: "إلغاءالحجز",
                            onTap: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.rightSlide,
                                title: 'هل تريد بالفعل إلغاء الحجز؟',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () async {
                                  addNameDeletebook();
                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: "تم إرسال طلب الإلغاء الى المشرف")
                                    ..show();
                                },
                              )..show();
                            },
                          ),
                        ],
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(fontSize: 15, color: Wihte),
                  ),
                );
              }
              return Center(
                child: Text("Loading...",
                    style: TextStyle(fontSize: 15, color: Wihte)),
              );
            },
          ),
        ]),
      ),
    );
  }
}
