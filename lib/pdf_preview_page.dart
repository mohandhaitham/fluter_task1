import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final Uint8List pdfData;

  const PdfPreviewPage({Key? key, required this.pdfData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (format) => pdfData,
      ),
    );
  }
}
