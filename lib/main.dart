import 'package:booking/GaarfaaNuberHud/Allbookingg.dart';
import 'package:booking/GaarfaaNuberHud/FirstGr.dart';
import 'package:booking/GaarfaaNuberHud/ForthGR.dart';
import 'package:booking/GaarfaaNuberHud/SecoundGr.dart';
import 'package:booking/GaarfaaNuberHud/ThaerdGR.dart';
import 'package:booking/NeberhudNwa/AllBook.dart';
import 'package:booking/NeberhudNwa/First.dart';
import 'package:booking/NeberhudNwa/Scand.dart';
import 'package:booking/NeberhudNwa/forth.dart';
import 'package:booking/NeberhudNwa/thaerd.dart';
import 'package:booking/ShackNuberHud/Allshaakbook.dart';
import 'package:booking/ShackNuberHud/Firstsh.dart';
import 'package:booking/ShackNuberHud/Forthsh.dart';
import 'package:booking/ShackNuberHud/Secondsh.dart';
import 'package:booking/ShackNuberHud/ThaerdSh.dart';
import 'package:booking/Uniyversites/ARABIC.dart';
import 'package:booking/Uniyversites/IUST.dart';
import 'package:booking/Uniyversites/QPU.dart';
import 'package:booking/Uniyversites/RSH.dart';
import 'package:booking/Uniyversites/SPU.dart';
import 'package:booking/Uniyversites/jpu.dart';
import 'package:booking/auth/success.dart';
import 'package:booking/pages/Addusers.dart';
import 'package:booking/pages/AfterBook.dart';
import 'package:booking/pages/Allusers.dart';
import 'package:booking/pages/BookingGarrfa.dart';
import 'package:booking/pages/BookingNawa.dart';
import 'package:booking/pages/BookingPage.dart';
import 'package:booking/pages/BookingShaak.dart';
import 'package:booking/pages/Home.dart';
import 'package:booking/pages/Login.dart';
import 'package:booking/pages/Message.dart';
import 'package:booking/pages/UinvercityHome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Uniyversites/EPU.dart';

late SharedPreferences sharedPref;
Widget AorU() {
  var AdminorUser;
  if (sharedPref.getString("idnui").toString() == "202030010") {
    AdminorUser = Home();
  
  } else {
    AdminorUser = AfterBook();
  }

  print("${sharedPref.getString("idnui")}");
  print(AdminorUser);
  return AdminorUser;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: sharedPref.getString("id") != null ? "${AorU()}" : "Login",
      routes: {
        "Home": (context) => Home(),
        "Addusers": (context) => Addusers(),
        "Login": (context) => Login(),
        "BookingNawa": (context) => BookingNawa(),
        "First": (context) => First(studNumber: "studNumber", studName: ""),
        "Scand": (context) => Scand(),
        "thard": (context) => thard(),
        "forth": (context) => forth(),
        "Bookingchaak": (context) => Bookingchaak(),
        "BookingGarrfa": (context) => BookingGarrfa(),
        "Firstsh": (context) => FirstShacke(),
        "Secondsh": (context) => SecoundSh(),
        "ThaerdSh": (context) => thaerdsh(),
        "Forthsh": (context) => Forrthsh(),
        "FirstGr": (context) => FirstGr(),
        "SecoundGr": (context) => SecoundGr(),
        "ThaerdGR": (context) => ThaerdGR(),
        "ForthGR": (context) => ForthGR(),
        "Message": (context) => Message(),
        "Allusers": (context) => AllUserrs(),
        "UinvercityHome": (context) => UniyvercityHome(),
        "QPU": (context) => QPU(),
        "EPU": (context) => EPU(),
        "SPU": (context) => SPU(),
        "RSH": (context) => RSH(),
        "IUST": (context) => IUST(),
        "jpu": (context) => jpu(),
        "ARABIC": (context) => ARABIC(),
        "BookingPage": (context) => Bookginpage(),
        "success": (context) => success(),
        "AfterBook": (context) => AfterBook(),
        "AllBook": (context) => AllBook(),
        "Allshaakbook": (context) => Allshaakbook(),
        "Allbookingg": (context) => AllBookingg()
      },
    );
  }
}
