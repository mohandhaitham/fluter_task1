import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.0.125:8000/api';

  Future<dynamic> fetchOfficeTree(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/office_tree/$id'));

    if (response.statusCode == 200) {
      return json.decode(response.body); // Adjust based on your API response structure
    } else {
      throw Exception('Failed to load office tree');
    }
  }
}

