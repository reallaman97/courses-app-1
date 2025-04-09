import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final response = await http.get(url, headers: _headers());

    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final response = await http.post(
      url,
      headers: _headers(),
      body: json.encode(body),
    );

    return _handleResponse(response);
  }

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer your_token_here', // if needed
    };
  }

  dynamic _handleResponse(http.Response response) {
    final body = json.decode(response.body);

    if (response.statusCode == 200) {
      if (body['success'] == true) {
        return body['data'];
      } else {
        throw Exception(body['message']);
      }
    } else {
      throw Exception('API Error: ${response.statusCode}');
    }
  }
}
