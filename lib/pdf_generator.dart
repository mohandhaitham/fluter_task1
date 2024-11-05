import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfGenerator {
  static Future<Uint8List> generatePdfForDocument(Map<String, dynamic> document) async {
    final pdf = pw.Document();

    // Load the Arabic font
    final fontData = await rootBundle.load('assets/fonts/Cairo-Regular.ttf');
    final arabicFont = pw.Font.ttf(fontData);

    // Load the logo
    final logoData = await rootBundle.load('assets/logo.png');
    final logoImage = pw.MemoryImage(logoData.buffer.asUint8List());

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header with logo in the middle
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    // Arabic text on the right
                    pw.Expanded(
                      child: pw.Text(
                            'جمهورية العراق\n'
                            'وزارة الثقافة والسياحة والآثار\n'
                                'هيئة السياحة\n'
                            '${document['title']}',
                        style: pw.TextStyle(font: arabicFont, fontSize: 14),
                        textAlign: pw.TextAlign.right,
                      ),
                    ),

                    // Centered logo
                    pw.Container(
                      height: 100,
                      width: 100,
                      child: pw.Image(logoImage),
                    ),
                    // English text on the left
                    pw.Expanded(
                      child: pw.Text(
                        'Republic of Iraq\n'
                            'Ministry of Culture\n'
                            'Tourism Board\n'
                            '${document['title']}',

                        style: pw.TextStyle(font: arabicFont, fontSize: 13),
                        textAlign: pw.TextAlign.left,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Divider(),
                pw.SizedBox(height: 20),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children:[

                      pw.Text('الرقم: ${document['id']}', style: pw.TextStyle(font: arabicFont)),
                      pw.Text('التاريخ: ${document['published_date']}', style: pw.TextStyle(font: arabicFont)),
                    ]
                ),
                pw.SizedBox(height: 20),
                // Document details header
                pw.Center(

                  child:  pw.Text('الى: ${document['sender_organization_name'] ?? ''}', style: pw.TextStyle(
                      font: arabicFont,
                    fontSize: 14,

                  )
                    ,),
                ),

                pw.SizedBox(height:10),
                pw.Column(
                  children: [
                    pw.Center(
                      child: pw.Text(
                        ': ${document['document_type_name'] ?? ''}',
                        style: pw.TextStyle(font: arabicFont),
                      ),
                    ),
                    pw.Center(
                      child: pw.Text(
                        'ملاحظة: ${document['notes'] ?? ''}',
                        style: pw.TextStyle(font: arabicFont),
                      ),
                    ),
                  ],
                ),

                pw.SizedBox(height: 20),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children:[
                      pw.Text('التوقيع: ${document['signature'] ?? ''}', style: pw.TextStyle(font: arabicFont)),
                    ]
                ),
                pw.Spacer(), // Pushes the footer to the bottom of the page
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children:[

                      pw.Text(
                        'نسخه منه الى: ${document['received_organization_name'] ?? ''}',
                        style: pw.TextStyle(
                          font: arabicFont,
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),

                    ]
                ),
                // Footer
                pw.Divider(),
                pw.Center(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text(
                        'العراق-بغداد-شارع حيفا-بناء(90) خطوط الهاتف 5373075 \\ 5384373 \\ 5372551\n'
                                         'mobile +9647800072575',

                        style: pw.TextStyle(font: arabicFont, fontSize: 10),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'Email : tourismbord@tourism.gov.iq',
                        style: pw.TextStyle(fontSize: 10),
                      ),
                      pw.Text(
                        'www.tourism.gov.iq',
                        style: pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }
}
