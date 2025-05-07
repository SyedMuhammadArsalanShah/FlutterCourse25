import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          // color: Color(0xff159A9C),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff134e5e), Color(0xff71b280)],
            stops: [0, 1],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
          child: Center(
            child: Text(
              "حمزہ فیصل",
              style: GoogleFonts.notoNastaliqUrdu(
                  fontSize: 85,
                  color: const Color.fromARGB(255, 220, 222, 250)),
            ),
          ),
        )),
      ),
    );
  }
}
