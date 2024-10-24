import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  String baseURL = dotenv.get('SERVER_URL');
  // GET request
  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse('$baseURL/$url'));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data); // Returns the decoded JSON response
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }

  // POST request
  Future<dynamic> postData(Map<String, dynamic> body) async {
    http.Response response = await http.post(
      Uri.parse('$baseURL/$url'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      String data = response.body;
      return jsonDecode(data); // Returns the decoded JSON response
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('Failed to post data');
    }
  }
}
