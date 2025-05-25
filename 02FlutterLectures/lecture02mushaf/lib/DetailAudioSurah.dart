import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:just_audio/just_audio.dart';

class Detailaudiosurah extends StatefulWidget {
  var surahNum;
  Detailaudiosurah(this.surahNum, {super.key});

  @override
  State<Detailaudiosurah> createState() => _DetailaudiosurahState();
}

class _DetailaudiosurahState extends State<Detailaudiosurah> {
  AudioPlayer audioPlayer = AudioPlayer();
  IconData playPauseBtn = Icons.play_arrow_rounded;
  bool isplaying = true;

  meraToggleBtn() async {
    final audioUrl = await quran.getAudioURLBySurah(widget.surahNum);

    audioPlayer.setUrl(audioUrl);

    if (isplaying) {
      audioPlayer.play();
      setState(() {
        isplaying = false;
        playPauseBtn = Icons.pause_circle_rounded;
      });
    } else {
      audioPlayer.pause();
      setState(() {
        isplaying = true;
        playPauseBtn = Icons.play_arrow_rounded;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            quran.getSurahNameArabic(widget.surahNum),
            style: GoogleFonts.amiriQuran(fontSize: 30),
          ),
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.indigo[900],
            backgroundImage: AssetImage("assets/images/alaffasy.png"),
          ),
          Container(
            width: double.infinity,
            color: Colors.indigo[900],
            child: IconButton(
                onPressed: meraToggleBtn,
                icon: Icon(
                  playPauseBtn,
                  color: Colors.white,
                )),
          )
        ],
      )),
    );
  }
}
