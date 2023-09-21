import 'package:booking/Customs/color.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/main.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllUserrs extends StatelessWidget {
  AllUserrs({super.key});

  Crud _crud = Crud();

  viewUsers() async {
    var response = await _crud
        .postRequest(linkviewUsers, {"id": sharedPref.getString("id")});
    print("response = ${response}");
    return response;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Black,
      appBar: AppBar(backgroundColor: Hcolor, actions: []),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          FutureBuilder(
            future: viewUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
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
                              height: 450,
                              decoration: BoxDecoration(
                                  color: Hcolor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 40),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${snapshot.data['data'][i]['fullname']}",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                            Text(
                                              " : الاسم الكامل",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${snapshot.data['data'][i]['uniname']}",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                            Text(
                                              " : اسم الجامعة",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${snapshot.data['data'][i]['idnui']}",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                            Text(
                                              " : الرقم الجامعي",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${snapshot.data['data'][i]['phon']}",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                            Text(
                                              " : رقم الهاتف",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 140),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${snapshot.data['data'][i]['city']}",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                            Text(
                                              " : المدينة",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 150),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${snapshot.data['data'][i]['district']}",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                            Text(
                                              " : الحي",
                                              style: TextStyle(
                                                  fontSize: 25, color: Wihte),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
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
