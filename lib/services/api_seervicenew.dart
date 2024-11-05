import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String apiUrl = 'https://bilaltalat.pythonanywhere.com/api/document/list/';

  // Fetch data from the API
  Future<List<Map<String, dynamic>>> fetchAgendaData() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      print('Status Code: ${response.statusCode}');
      print('API Response: ${response.body}'); // Log the full response
      if (response.statusCode == 200) {
        // Decode the response body with UTF-8
        String decodedBody = utf8.decode(response.bodyBytes);
        List<dynamic> data = json.decode(decodedBody);
        return data.map((item) => item as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
