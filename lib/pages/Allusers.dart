import 'package:booking/Customs/AllusersCard.dart';
import 'package:booking/Customs/color.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/main.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllUserrs extends StatefulWidget {
  AllUserrs({super.key});

  @override
  State<AllUserrs> createState() => _AllUserrsState();
}

class _AllUserrsState extends State<AllUserrs> {
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
                      return Column(children: [
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
                                  "صفحة الطالب",
                                  style: TextStyle(fontSize: 30),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                AllusersCard(
                                  onTap: () async {
                                    var response = await _crud.postRequest(
                                        linkdeleteuser, {
                                      "id":
                                          "${snapshot.data['data'][i]['id'].toString()}"
                                    });

                                    setState(() {
                                      if (response['status'] == ['Success']) {
                                        Navigator.of(context)
                                            .pushReplacementNamed("Allusers");
                                      }
                                    });
                                  },
                                  name:
                                      "${snapshot.data['data'][i]['fullname']}",
                                  phon: "${snapshot.data['data'][i]['phon']}",
                                  uniname:
                                      "${snapshot.data['data'][i]['uniname']}",
                                  city: "${snapshot.data['data'][i]['city']}",
                                  hood:
                                      "${snapshot.data['data'][i]['district']}",
                                )
                              ],
                            ))
                      ]);
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
