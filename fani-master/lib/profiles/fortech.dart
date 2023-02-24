import 'package:fani/main.dart';
import 'package:flutter/material.dart';

class ForTech extends StatefulWidget {
  const ForTech({super.key});

  @override
  State<ForTech> createState() => _ForTechState();
}

class _ForTechState extends State<ForTech> {
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
