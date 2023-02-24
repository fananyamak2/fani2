import 'package:fani/main.dart';
import 'package:flutter/material.dart';

class ForUser extends StatefulWidget {
  const ForUser({super.key});

  @override
  State<ForUser> createState() => _ForUserState();
}

class _ForUserState extends State<ForUser> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
      ),
    );
  }
}
