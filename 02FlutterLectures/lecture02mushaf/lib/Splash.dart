import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lecture02mushaf/ButtonSCR.dart';

import 'IndexSurahSCR.dart';

class MeriSplashSCR extends StatefulWidget {
  const MeriSplashSCR({super.key});

  @override
  State<MeriSplashSCR> createState() => _MeriSplashSCRState();
}

class _MeriSplashSCRState extends State<MeriSplashSCR> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Buttonscr(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          // color: Colors.teal,
          decoration: BoxDecoration(
              // color: Colors.teal,
              // https://fluttergradientgenerator.com/
              gradient: LinearGradient(
            colors: [Color(0xff134e5e), Color(0xff71b280)],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Center(
              child: Text(
            "مصحف ",
            style: GoogleFonts.amiriQuran(fontSize: 35, color: Colors.white),
          ))),
    );
  }
}
