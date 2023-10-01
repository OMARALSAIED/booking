import 'package:booking/Customs/color.dart';
import 'package:booking/Customs/deleteCardForm.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Message extends StatelessWidget {
  Message({super.key});

  Crud _crud = Crud();

  getNamedleteBooking() async {
    var response = await _crud
        .postRequest(getNameDeleteBooking, {"id": sharedPref.getString("id")});
    print("response = ${response}");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Black,
        actions: [],
        title: Center(
          child: Text(
            "رسائل الإلغاء",
            style: TextStyle(fontSize: 30, color: Hcolor),
          ),
        ),
      ),
      backgroundColor: Black,
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          FutureBuilder(
            future: getNamedleteBooking(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          deleteCardForm(
                            name: "${snapshot.data['data'][i]['fullname']}",
                          ),
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
