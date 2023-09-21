import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:booking/Customs/color.dart';
import 'package:booking/Customs/customBookbutton.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/main.dart';
import 'package:flutter/material.dart';

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

  getName() async {
    var response = await _crud
        .postRequest(linkgetName, {"id": sharedPref.getString("id")});

    return response;
  }

  deleteBook() async {
    var response = await _crud
        .postRequest(linkdeleteBook, {"user_id": sharedPref.getString("id")});

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Black,
      appBar: AppBar(backgroundColor: Hcolor, actions: []),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          FutureBuilder(
            future: getbook(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['status'] == 'Failed')
                  return Center(
                    
                    child: Text(
                      "ليس لديك أي حجز حاليا",
                      style: TextStyle(fontSize: 30, color: Wihte),
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${snapshot.data['data'][i]['booktime']}",
                                          style: TextStyle(
                                              fontSize: 20, color: Wihte),
                                        ),
                                        Text(
                                          " : وقت الرحلة الساعة",
                                          style: TextStyle(
                                              fontSize: 25, color: Wihte),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60),
                                    child: Row(
                                      children: [
                                        Text(
                                          " : الوقت الذي تم فيه الحجز",
                                          style: TextStyle(
                                              fontSize: 25, color: Wihte),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data['data'][i]['time']}",
                                    style:
                                        TextStyle(fontSize: 20, color: Wihte),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        " الاسم : ",
                                        style: TextStyle(
                                            fontSize: 25, color: Wihte),
                                      ),
                                      Text(
                                        "${snapshot.data['data'][i]['fullname']}",
                                        style: TextStyle(
                                            fontSize: 20, color: Wihte),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 100,
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
                                  await deleteBook();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "BookingPage", (route) => false);
                                },
                              )..show();
                            },
                          ),
                        ],
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting        ) {
                return Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }
              return Center(
                child: Text("Loading...", style: TextStyle(fontSize: 15)),
              );
            },
          ),
        ]),
      ),
    );
  }
}
