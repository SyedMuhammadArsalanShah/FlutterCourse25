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
          trailing: Text(quran.getVerseCount(index + 1).toString()),
        );
      },
    ));
  }
}
