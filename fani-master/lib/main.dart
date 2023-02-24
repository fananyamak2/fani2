import 'dart:ui';

import 'package:fani/auth/login.dart';
import 'package:fani/auth/signup.dart';
import 'package:fani/auth/techn.dart';
import 'package:fani/auth/uort.dart';
import 'package:fani/auth/user.dart';
import 'package:fani/pages/select_service.dart';
import 'package:fani/pages/cleaning.dart';
import 'package:fani/profiles/fortech.dart';
import 'package:fani/profiles/foruser.dart';
import 'package:fani/serv/carpenter.dart';
import 'package:fani/serv/cc.dart';
import 'package:fani/serv/ccc.dart';
import 'package:fani/serv/clean.dart';
import 'package:fani/serv/electric.dart';
import 'package:fani/serv/gardener.dart';
import 'package:fani/serv/gas.dart';
import 'package:fani/serv/painter.dart';
import 'package:fani/serv/plumber.dart';
import 'package:fani/serv/salon.dart';
import 'package:flutter/material.dart';

final Color db = Color(0xFF488FCD); //Dark blue
final Color dy = Color(0xFFF8981D); //Dark yallow
final Color ly = Color(0xFFFFCC111); //light yallow
final Color lb = Color(0xFFF0FBCD4); //light blue

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: User(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            errorColor: dy,
          ),
        ),
        routes: {
          "login": (context) => Login(),
          "techn": (context) => Techn(),
          "signup": (context) => SignUp(),
          "home": (context) => Home(),
          "uort": (context) => Uort(),
          "user": (context) => User(),
          //serv
          "clean": (context) => Clean(),
          "carpenter": (context) => Carpenter(),
          "gas": (context) => Gas(),
          "salon": (context) => Salon(),
          "plumber": (context) => Plumber(),
          "painter": (context) => Painter(),
          "gardener": (context) => Gardener(),
          "electric": (context) => Electric(),
          "cc": (context) => Cc(),
          "ccc": (context) => Ccc(),
          //profiles
          "foruser": (context) => ForUser(),
          "fortechn": (context) => ForTech(),
          //pages
          "select_service": (context) => SelectService(),
          "cleaning": (context) => CleaningPage(),
        });
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = screenWidth * .88;
    final double buttonHeight = screenHeight * 0.08;
    // final double imageSizew = screenHeight * double.infinity;
    // final double imageSizeh = screenHeight * 0.5;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 166, 199, 227),
                Colors.white,
                Color.fromARGB(255, 250, 240, 154),
                ly
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // height: imageSize,
                    // width: imageSize,
                    child: Image.asset('images/1.png'),
                  ),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  child: Text(
                    'تسجيل دخول',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(db),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("signup");
                  },
                  child: Text(
                    'إنشاء حساب',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(lb),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
