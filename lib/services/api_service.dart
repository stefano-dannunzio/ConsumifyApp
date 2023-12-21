import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String apiUrl = 'http://localhost:3000';

  Future<List<dynamic>> getRecommendations() async {
    final response = await http.get(Uri.parse(
        '$apiUrl/tracks/recommendations/limit/10?seed_genres=classical&seed_artists=4NHQUGzhtTLFvgF5SZesLK'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load recommendations');
    }
  }
}
