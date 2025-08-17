import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SurahRahman(),
    );
  }
}

class SurahRahman extends StatefulWidget {
  const SurahRahman({super.key});

  @override
  State<SurahRahman> createState() => _SurahRahmanState();
}

class _SurahRahmanState extends State<SurahRahman> {
  List listverses = [];
  Map surahrahmanmap = {};
  loadkaro() async {
    final response = await rootBundle.loadString("assets/surahrahman.json");

    setState(() {
      surahrahmanmap = jsonDecode(response);
      listverses = surahrahmanmap["data"]["ayahs"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadkaro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listverses.length,
        itemBuilder: (context, index) {
          return Container(
            color: const Color.fromARGB(255, 93, 120, 255),
            width: double.infinity,
            child: Text(
              listverses[index]["text"],
              textDirection: TextDirection.rtl,
              style: GoogleFonts.amiriQuran(
              
                color: Colors.white, fontSize: 29),
            ),
          );
        },
      ),
    );
  }
}
