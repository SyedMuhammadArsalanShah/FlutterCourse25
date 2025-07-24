import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashSCR());
  }
}

class SplashSCR extends StatefulWidget {
  const SplashSCR({super.key});

  @override
  State<SplashSCR> createState() => _SplashSCRState();
}

class _SplashSCRState extends State<SplashSCR> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SurahTabSCR()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(child: Text("Mushaf")),
    );
  }
}

class SurahTabSCR extends StatefulWidget {
  const SurahTabSCR({super.key});

  @override
  State<SurahTabSCR> createState() => _SurahTabSCRState();
}

class _SurahTabSCRState extends State<SurahTabSCR> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mushaf App"),
          centerTitle: true,

          bottom: TabBar(
            tabs: [Tab(text: "Quran"), Tab(text: "Quran Translation")],
          ),
        ),
        body: TabBarView(children: [SurahIndexSCR(), SurahIndexTSCR()]),
      ),
    );
  }
}

class SurahIndexSCR extends StatefulWidget {
  const SurahIndexSCR({super.key});

  @override
  State<SurahIndexSCR> createState() => _SurahIndexSCRState();
}

class _SurahIndexSCRState extends State<SurahIndexSCR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Coming Soon INSHAALLAH"),
        ),
      ),
    );
  }
}

class SurahIndexTSCR extends StatefulWidget {
  const SurahIndexTSCR({super.key});

  @override
  State<SurahIndexTSCR> createState() => _SurahIndexTSCRState();
}

class _SurahIndexTSCRState extends State<SurahIndexTSCR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(" Translation Coming Soon INSHAALLAH"),
        ),
      ),
    );
  }
}
