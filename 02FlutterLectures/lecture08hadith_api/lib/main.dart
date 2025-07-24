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
      home: BooksSCR(),
    );
  }
}

class BooksSCR extends StatefulWidget {
  const BooksSCR({super.key});

  @override
  State<BooksSCR> createState() => _BooksSCRState();
}

class _BooksSCRState extends State<BooksSCR> {
  Map map = {};
  List list = [];

  void apicallkardo() async {
    http.Response meraresponse = await http.get(
      Uri.parse(
        "https://hadithapi.com/api/books?apiKey=\$2y\$10\$BylaBcXs5Lw7ZOtYmQ3PXO1x15zpp26oc1FeGktdmF6YeYoRd88e",
      ),
    );
    if (meraresponse.statusCode == 200) {
      setState(() {
        map = jsonDecode(meraresponse.body);
        list = map["books"];
      });
    }
  }

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
                  builder: (context) => ChaptersSCR(list[index]["bookSlug"]),
                ),
              );
            },
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(list[index]["bookName"]),
            subtitle: Text(list[index]["writerName"]),
          );
        },
      ),
    );
  }
}

class ChaptersSCR extends StatefulWidget {
  var bookSlug;
  ChaptersSCR(this.bookSlug, {super.key});

  @override
  State<ChaptersSCR> createState() => _ChaptersSCRState();
}

class _ChaptersSCRState extends State<ChaptersSCR> {
  Map map = {};
  List list = [];

  void apicallkardo() async {
    http.Response meraresponse = await http.get(
      Uri.parse(
        "https://hadithapi.com/api/${widget.bookSlug}/chapters?apiKey=\$2y\$10\$BylaBcXs5Lw7ZOtYmQ3PXO1x15zpp26oc1FeGktdmF6YeYoRd88e",
      ),
    );
    if (meraresponse.statusCode == 200) {
      setState(() {
        map = jsonDecode(meraresponse.body);
        list = map["chapters"];
      });
    }
  }

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
                  builder:
                      (context) => HadithsSCR(
                        list[index]["bookSlug"],
                        list[index]["chapterNumber"],
                      ),
                ),
              );
            },
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(list[index]["chapterArabic"]),
            subtitle: Text(list[index]["chapterUrdu"]),
          );
        },
      ),
    );
  }
}

class HadithsSCR extends StatefulWidget {
  var bookSlug;
  var chapterNum;
  HadithsSCR(this.bookSlug, this.chapterNum, {super.key});

  @override
  State<HadithsSCR> createState() => _HadithsSCRState();
}

class _HadithsSCRState extends State<HadithsSCR> {
  Map map = {};
  List list = [];

  void apicallkardo() async {
    http.Response meraresponse = await http.get(
      Uri.parse(
        "https://hadithapi.com/public/api/hadiths?apiKey=\$2y\$10\$BylaBcXs5Lw7ZOtYmQ3PXO1x15zpp26oc1FeGktdmF6YeYoRd88e&book=${widget.bookSlug}&chapter=${widget.chapterNum}&paginate=100000",
      ),
    );
    if (meraresponse.statusCode == 200) {
      setState(() {
        map = jsonDecode(meraresponse.body);
        list = map["hadiths"]["data"];
      });
    }
  }

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
          
            title: Text(list[index]["hadithArabic"]),
            subtitle: Column(
              children: [
                
                Text(list[index]["hadithEnglish"]),
                Text(list[index]["hadithUrdu"]),
              ],
            ),
          );
        },
      ),
    );
  }
}
