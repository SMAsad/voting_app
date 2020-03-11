import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:voting_app/styles.dart';

class PdfPage extends StatelessWidget {
  String pdfUrl;

  PdfPage({
    Key key,
    @required this.pdfUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: appColors.background,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: appColors.mainTheme,
              title: Text('Bill Info'),
            ),
            body: PdfWidget(pdfUrl: pdfUrl)));
  }
}

class PdfWidget extends StatefulWidget {
  @override
  _PdfWidgetState createState() => _PdfWidgetState();
  String pdfUrl;

  PdfWidget({
    Key key,
    @required this.pdfUrl,
  }) : super(key: key);
}

class _PdfWidgetState extends State<PdfWidget> {
  String path;

  @override
  initState() {
    super.initState();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/teste.pdf');
  }

  Future<File> writeCounter(Uint8List stream) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsBytes(stream);
  }

  Future<Uint8List> fetchPost() async {
    final response = await http.get(widget.pdfUrl);
    final responseJson = response.bodyBytes;

    return responseJson;
  }

  loadPdf() async {
    writeCounter(await fetchPost());
    path = (await _localFile).path;

    if (!mounted) return;

    setState(() {});
  }

  Widget outView() {
    if (path != null)
      return PdfViewer(
        filePath: path,
      );
    else
      return Text("Bill info did not load :(");
  }

  @override
  Widget build(BuildContext context) {
    loadPdf();
    return Center(
      child: outView(),
    );
  }
}