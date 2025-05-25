import 'package:flutter/material.dart';
import 'package:lecture02mushaf/AudioIndexSurah.dart';
import 'package:lecture02mushaf/IndexSurahSCR.dart';

class Buttonscr extends StatefulWidget {
  const Buttonscr({super.key});

  @override
  State<Buttonscr> createState() => _ButtonscrState();
}

class _ButtonscrState extends State<Buttonscr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndexSurahSCR(),
                      ));
                },
                child: Text("ReadMushaf")),
                SizedBox(height: 10,)
,            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Audioindexsurah(),
                      ));
                },
                child: Text("ListenMushaf")),
          ],
        ),
      ),
    );
  }
}
