import 'package:fani/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fani/main.dart';

class Uort extends StatefulWidget {
  const Uort({super.key});

  @override
  State<Uort> createState() => _UortState();
}

class _UortState extends State<Uort> {
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
                  Navigator.of(context).pushNamed("signup");
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'هل أنت ',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: dy),
                  ),
                  SizedBox(height: 5),
                  RadioListTile(
                    title: Text(
                      'أنثى',
                      style: TextStyle(fontSize: 22, color: db),
                    ),
                    value: 'male',
                    groupValue: gen,
                    onChanged: (value) {
                      setState(() {
                        gen = value as String?;
                        // print(value.toString() + "  " + gen.toString());
                      });
                    },
                    activeColor: db,
                    secondary: gen == 'male'
                        ? Icon(
                            Icons.male,
                            size: 28,
                            color: lb,
                          )
                        : null,
                  ),
                  RadioListTile(
                    title: Text(
                      'ذكر',
                      style: TextStyle(fontSize: 22, color: db),
                    ),
                    value: 'female',
                    groupValue: gen,
                    onChanged: (value) {
                      setState(() {
                        gen = value as String?;
                        //  print(value.toString() + "  " + gen.toString());
                      });
                    },
                    activeColor: db,
                    secondary: gen == 'female'
                        ? Icon(
                            size: 28,
                            Icons.female,
                            color: lb,
                          )
                        : null,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تاريخ ميلادك',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: dy),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 175,
                    child: SizedBox(
                      height: 175,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: datatime,
                        minimumYear: 1900,
                        maximumYear: DateTime.now().year,
                        maximumDate: DateTime.now(),
                        onDateTimeChanged: (DateTime nt) {
                          setState(
                            () => datatime = nt,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 30, 20),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 40, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'هل تريد أن تكون فَنَي ؟',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: db,
                      ),
                    ),
                  ),
                  Switch(
                    value: isSwtch,
                    onChanged: (value) {
                      setState(() {
                        isSwtch = value;
                        if (isSwtch) {
                          if (_formKey1.currentState!.validate()) {
                            if (gen == null) {
                              isSwtch = false;
                              print("Gender err: ${gen.toString()}");
                              print(
                                  "Selected date: ${datatime.year.toString()}  ${datatime.month.toString()}  ${datatime.day.toString()}");
                            } else {
                              Navigator.of(context).pushNamed("techn");
                              print("Gender init: ${gen.toString()}");
                              print(
                                  "Selected date: ${datatime.year.toString()}  ${datatime.month.toString()} ${datatime.day.toString()}");
                              isSwtch = false;
                            }
                          }
                        }
                      });
                    },
                    inactiveThumbColor: lb,
                    activeTrackColor: ly,
                    activeColor: dy,
                  ),
                ],
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey1.currentState!.validate()) {
                    if (gen == null) {
                      print("Gender err: ${gen.toString()}");
                      print(
                          "Selected date: ${datatime.year.toString()}  ${datatime.month.toString()}  ${datatime.day.toString()}");
                    } else {
                      Navigator.of(context).pushNamed("user");
                      print("Gender init: ${gen.toString()}");
                      print(
                          "Selected date: ${datatime.year.toString()}  ${datatime.month.toString()} ${datatime.day.toString()}");
                      isSwtch = false;
                    }
                  }
                },
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
          ]),
        ),
      ),
    );
  }
}
