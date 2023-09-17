import 'package:booking/Customs/color.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/main.dart';

import 'package:flutter/material.dart';

class First extends StatefulWidget {
  final String studNumber;
  final String studName;
  const First({super.key, required this.studNumber, required this.studName});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  Crud _crud = Crud();
  getbook() async {
    var response = await _crud
        .postRequest(linkviewbook, {"user_id": sharedPref.getString("id")});

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
            future: getbook(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return CustomBookingCard(
                        time: "${snapshot.data['data'][i]['booktime']}",
                        name: "${snapshot.data['data'][i]['user_id']}",
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

class CustomBookingCard extends StatelessWidget {
  const CustomBookingCard({
    super.key,
    required this.name,
    required this.time,
  });
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 20,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              ": اسم الطالب",
              style: TextStyle(fontSize: 15),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 20,
            ),
            Text(
              time,
              style: TextStyle(fontSize: 20),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              "وقت الحجز : الساعة",
              style: TextStyle(fontSize: 15),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        )
      ],
    ));
  }
}
