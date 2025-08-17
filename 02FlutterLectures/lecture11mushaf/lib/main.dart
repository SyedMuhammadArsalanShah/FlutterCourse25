import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
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
      body: Center(child: Text("مصحف", style: GoogleFonts.arefRuqaa(color: Colors.white,fontSize: 50),)),
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
      body: ListView.builder(
        itemCount: quran.totalSurahCount,
        itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailQuran(index+1)));
          },
          leading: CircleAvatar(child: Text("${index+1}"),),
          title: Text(quran.getSurahNameArabic(index+1),style: GoogleFonts.amiriQuran(),),
          subtitle: Text(quran.getSurahNameEnglish(index+1)),
          trailing: Text(quran.getVerseCount(index+1).toString()),
          
          );
      },)
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
      body: ListView.builder(
        itemCount: quran.totalSurahCount,
        itemBuilder: (context, index) {
        return ListTile(
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailQuranT(index+1)));
          },
          leading: CircleAvatar(child: Text("${index+1}"),),
          title: Text(quran.getSurahName(index+1)),
          subtitle: Text(quran.getSurahNameEnglish(index+1)),
          trailing: Text(quran.getVerseCount(index+1).toString()),
          
          );
      },)
    );
  }
}




class DetailQuran extends StatefulWidget {
  var surahNum;
  DetailQuran(this.surahNum, {super.key});

  @override
  State<DetailQuran> createState() => _DetailQuranState();
}

class _DetailQuranState extends State<DetailQuran> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(quran.getSurahName(widget.surahNum)),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: quran.getVerseCount(widget.surahNum),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    quran.getVerse(widget.surahNum, index + 1, verseEndSymbol: true),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.amiri(),
                  ),
                );
              },
            ),
          ),
        ),
    );
  }
}


class DetailQuranT extends StatefulWidget {
var surahNum;
DetailQuranT(this.surahNum,{super.key});

  @override
  State<DetailQuranT> createState() => _DetailQuranTState();
}

class _DetailQuranTState extends State<DetailQuranT> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(quran.getSurahName(widget.surahNum)),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: quran.getVerseCount(widget.surahNum),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    quran.getVerse(widget.surahNum, index + 1, verseEndSymbol: true),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.amiri(),
                  ),
                     subtitle: Text(
                    quran.getVerseTranslation(widget.surahNum, index + 1, translation: quran.Translation.urdu),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.notoNastaliqUrdu(),
                  ),
                );
              },
            ),
          ),
        ),
    );
   }
}