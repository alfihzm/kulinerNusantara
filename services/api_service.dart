// services/api_service.dart
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://example.com/api';

  static Future<void> fetchData() async {
    final url = Uri.parse('$baseUrl/data');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> postData(Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/post');

    try {
      final response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
