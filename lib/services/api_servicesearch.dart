import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServiceSearch {
  Future<List<dynamic>> fetchSearchResults(String query) async {
    final response = await http.get(
      Uri.parse('https://bilaltalat.pythonanywhere.com/api/document/search/?query=$query'),
    );

    if (response.statusCode == 200) {
      // Decode response body with UTF-8 encoding
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
