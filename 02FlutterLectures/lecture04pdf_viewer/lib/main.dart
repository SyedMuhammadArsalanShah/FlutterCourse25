import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BookListSCR(),
    );
  }
}

class BookListSCR extends StatefulWidget {
  const BookListSCR({super.key});

  @override
  State<BookListSCR> createState() => _BookListSCRState();
}

class _BookListSCRState extends State<BookListSCR> {
  List bookList = [
    {"name": "Quran | Mushaf", "merilocation": "assets/mushaf.pdf"},
    {"name": "Atlas Seerat  ", "merilocation": "assets/seerat_saw.pdf"},
    {"name": "Seerat Khadijah R.A ", "merilocation": "assets/khadijah_ra.pdf"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PdfSCR(index)),
              );
            },
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(bookList[index]["name"]),
          );
        },
      ),
    );
  }
}

class PdfSCR extends StatefulWidget {
  var bookNumber;
  PdfSCR(this.bookNumber, {super.key});

  @override
  State<PdfSCR> createState() => _PdfSCRState();
}

class _PdfSCRState extends State<PdfSCR> {
  List bookList = [
    {"name": "Quran | Mushaf", "merilocation": "assets/mushaf.pdf"},
    {"name": "Atlas Seerat  ", "merilocation": "assets/seerat_saw.pdf"},
    {"name": "Seerat Khadijah R.A ", "merilocation": "assets/khadijah_ra.pdf"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.asset(bookList[widget.bookNumber]["merilocation"]),
    );
  }
}
