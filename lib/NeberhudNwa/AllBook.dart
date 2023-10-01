import 'package:booking/Customs/CustomDeleteBookingcard.dart';
import 'package:booking/Customs/color.dart';
import 'package:booking/auth/Linkapi.dart';
import 'package:booking/auth/PostandGetFun.dart';
import 'package:booking/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllBook extends StatefulWidget {
  AllBook({super.key});

  @override
  State<AllBook> createState() => _AllBookState();
}

class _AllBookState extends State<AllBook> {
  Crud _crud = Crud();

  getsortbyNawa() async {
    var response = await _crud
        .postRequest(getsortbyNawacity, {"id": sharedPref.getString("id")});
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
            future: getsortbyNawa(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return CustomDeleteBookingCard(
                        onTap: () async {
                                    var response = await _crud.postRequest(
                                        linkdeleteBook, {
                                      "user_id":
                                          "${snapshot.data['data'][i]['id'].toString()}"
                                    });

                                    if (response['status'] == ['Success']) {
                                      Navigator.of(context)
                                          .pushReplacementNamed("AllBook");
                                      setState(() {});
                                    }
                                  },
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
