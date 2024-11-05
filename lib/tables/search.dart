import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../services/api_servicesearch.dart';
import '../pdf_generator.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ApiServiceSearch apiService = ApiServiceSearch();
  List<dynamic> searchResults = [];
  String query = '';
  final ScrollController _scrollController = ScrollController(); // Step 1: Create a ScrollController

  void searchDocuments(String query) async {
    try {
      final results = await apiService.fetchSearchResults(query);
      setState(() {
        searchResults = results;
      });
      // Step 2: Scroll to the right after updating results
      Future.delayed(Duration(milliseconds: 100), () {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    } catch (e) {
      print("Error fetching results: $e");
    }
  }

  Future<void> downloadPdfForDocument(Map<String, dynamic> document) async {
    try {
      final pdfData = await PdfGenerator.generatePdfForDocument(document);
      await Printing.layoutPdf(onLayout: (format) async => pdfData);
    } catch (e) {
      print("Error generating PDF: $e");
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0087C7),
        elevation: 12.0,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          "البحث",
          style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
                searchDocuments(query);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.blueAccent), // Style for the label
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                  borderSide: BorderSide(
                    color: Colors.blue, // Color of the border
                    width: 3.0, // Width of the border
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners when focused
                  borderSide: BorderSide(
                    color: Colors.green, // Color of the border when focused
                    width: 2.0, // Width of the border when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners when enabled
                  borderSide: BorderSide(
                    color: Colors.grey, // Color of the border when enabled
                    width: 2.0, // Width of the border when enabled
                  ),
                ),
                filled: true, // Fill the TextField with a color
                fillColor: Colors.white, // Background color of the TextField
              ),
            ),

            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController, // Step 3: Attach the ScrollController
                scrollDirection: Axis.horizontal,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                    child: searchResults.isEmpty
                        ? Center(child: Text("لا توجد نتائج للبحث.", style: TextStyle(fontSize: 20)))
                     : DataTable(
                    border: TableBorder.all(color: Colors.grey, width: 1.0),
                    headingRowColor: MaterialStateProperty.all(Color(0xFF0087C7)),
                    columns: const [
                      DataColumn(label: Text('استعراض\n'
                          'الوثيقة',
                          style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('العنوان', style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('تاريخ', style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('الدائرة', style: TextStyle(color: Colors.white))),
                      DataColumn(label: Text('الرقم', style: TextStyle(color: Colors.white))),
                    ],
                    rows: searchResults.map((document) {
                      return DataRow(
                        cells: [
                          DataCell(
                            IconButton(
                              icon: Icon(Icons.download),
                              onPressed: () => downloadPdfForDocument(document),
                            ),
                          ),
                          DataCell(
                            Container(
                              width: 100, // Set a smaller height for the title cell
                              child: Text(
                                document['title'] ?? '',

                                maxLines: 2, // Allow up to 2 lines
                                overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                              ),
                            ),
                          ),
                          DataCell(Expanded(child: Text(document['published_date'] ?? ''))),
                          DataCell(Expanded(child: Container(width: 150, child: Text(document['sender_organization_name'] ?? '',

                            maxLines: 2, // Allow up to 2 lines
                            overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                          )))),
                          DataCell(Expanded(child: Text(document['id'].toString()))),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
