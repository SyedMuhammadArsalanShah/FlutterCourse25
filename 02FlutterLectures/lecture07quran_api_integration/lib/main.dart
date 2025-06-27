import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SurahIndexSCR(),
    );
  }
}

class SurahIndexSCR extends StatefulWidget {
  const SurahIndexSCR({super.key});

  @override
  State<SurahIndexSCR> createState() => _SurahIndexSCRState();
}

class _SurahIndexSCRState extends State<SurahIndexSCR> {
  Map map = {};
  List list = [];

  void apicallkardo() async {
    http.Response meraresponse = await http.get(
      Uri.parse("https://api.alquran.cloud/v1/surah"),
    );
    if (meraresponse.statusCode == 200) {
      setState(() {
        map = jsonDecode(meraresponse.body);
        list = map["data"];
      });
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicallkardo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailSurah(list[index]["number"]),
                ),
              );
            },
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(
              list[index]["name"] + " | " + list[index]["englishName"],
            ),
            subtitle: Text(list[index]["englishNameTranslation"]),
            trailing: Column(
              children: [
              
                list[index]["revelationType"] == "Meccan"
                    ? Image.asset(
                      "assets/images/kaaba.png",
                      width: 30,
                      height: 30,
                    )
                    : Image.asset(
                      "assets/images/madina.png",
                      width: 30,
                      height: 30,
                    ),
                      Text("Verses ${list[index]["numberOfAyahs"]}"),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DetailSurah extends StatefulWidget {
  var surahNum;
  DetailSurah(this.surahNum, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  Map map = {};
  List list = [];

  void apicallkardo() async {
    http.Response meraresponse = await http.get(
      Uri.parse("https://api.alquran.cloud/v1/surah/${widget.surahNum}"),
    );
    if (meraresponse.statusCode == 200) {
      setState(() {
        map = jsonDecode(meraresponse.body);
        list = map["data"]["ayahs"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicallkardo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              list[index]["text"],
            ),
          );
        },
      ),
    );
  }
}
