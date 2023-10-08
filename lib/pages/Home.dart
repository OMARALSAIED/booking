import 'package:booking/main.dart';
import 'package:booking/pages/Message.dart';
import 'package:booking/pages/UinvercityHome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../Customs/color.dart';
import 'Addusers.dart';
import 'Adminpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final screen = [
    Message(),
    Addusers(),
    Adminpage(),
    UniyvercityHome(),
  ];
  int index = 2;
  final items = [
    const Icon(
      Icons.message,
      size: 30,
    ),
    const Icon(
      Icons.add,
      size: 30,
    ),
    const Icon(
      Icons.home,
      size: 30,
    ),
    const Icon(
      Icons.house,
      size: 30,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Hcolor, actions: [
        IconButton(
            onPressed: () {
              sharedPref.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("Login", (route) => false);
            },
            icon: Icon(Icons.exit_to_app))
      ]),
      backgroundColor: Black,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Black,
        buttonBackgroundColor: Hcolor,
        items: items,
        index: index,
        color: Hcolor,
        height: 60,
        onTap: (index) => setState(() {
          this.index = index;
        }),
      ),
      body: screen[index],
    );
  }
}
