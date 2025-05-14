import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'DetailSurah.dart';

class IndexSurahSCR extends StatefulWidget {
  const IndexSurahSCR({super.key});

  @override
  State<IndexSurahSCR> createState() => _IndexSurahSCRState();
}

class _IndexSurahSCRState extends State<IndexSurahSCR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            "assets/images/quran.png",
            width: 100,
            height: 100,
          ),
        ),
        body: ListView.builder(
          // itemCount: 114,
          itemCount: quran.totalSurahCount,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailSurah(index + 1),
                    ));
              },
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text(
                quran.getSurahNameArabic(index + 1),
                style: GoogleFonts.amiriQuran(),
              ),
              subtitle: Text(quran.getSurahName(index + 1)),
              trailing: Column(
                children: [
                  quran.getPlaceOfRevelation(index + 1) == "Makkah"
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
                  Text("Verses" + quran.getVerseCount(index + 1).toString()),
                ],
              ),
            );
          },
        ));
  }
}
