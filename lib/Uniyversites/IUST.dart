import 'package:booking/Customs/CustomBookingCard.dart';
import 'package:booking/Customs/color.dart';
import 'package:booking/auth/Linkapi.dart';

import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/main.dart';

import 'package:flutter/material.dart';

class IUST extends StatefulWidget {
  const IUST({
    super.key,
  });

  @override
  State<IUST> createState() => _IUSTState();
}

class _IUSTState extends State<IUST> {
  Crud _crud = Crud();
  getIUST() async {
    var response = await _crud
        .postRequest(getsortbyIUST, {"user_id": sharedPref.getString("id")});

    print("response = ${response}");
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
            future: getIUST(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return CustomBookingCard(
                        time: "${snapshot.data['data'][i]['booktime']}",
                        name: "${snapshot.data['data'][i]['fullname']}",
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
