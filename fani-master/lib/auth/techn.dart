import 'package:flutter/material.dart';
import 'package:fani/main.dart';

class Techn extends StatefulWidget {
  const Techn({super.key});

  @override
  State<Techn> createState() => _TechnState();
}

class _TechnState extends State<Techn> {
  final _formKey1 = GlobalKey<FormState>();
  String? gen;
  DateTime datatime = DateTime(2000);
  bool isSwtch = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Form(
          key: _formKey1,
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 40, 250, 0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: Colors.black26,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("uort");
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: dy,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نوع العمل : ',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: dy),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Text(
                      '>>>>>ك',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold, color: dy),
                    ),
                    color: Colors.black12,
                    // width: 180,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: dy,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الخبرة :",
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: dy),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Text(
                      '>>>>>ك',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold, color: dy),
                    ),
                    color: Colors.black12,
                    // width: 180,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: dy,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "المدينة :",
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: dy),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Text(
                      '>>>>>ك',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold, color: dy),
                    ),
                    color: Colors.black12,
                    // width: 180,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
