import 'package:http/http.dart' as http;
import 'dart:convert';

class TracksService {
  final String apiUrl = 'http://consumify-api.onrender.com';

  Future<List<dynamic>> getRecommendations(
      String seedGenres, String seedArtists) async {
    final response = await http.get(Uri.parse(
        '$apiUrl/tracks/recommendations/limit/10?seed_genres=$seedGenres&seed_artists=$seedArtists'));

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

  Future<List<dynamic>> getRecomById(String id) async {
    final response =
        await http.get(Uri.parse('$apiUrl/tracks/recommendations/id/$id'));

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load track');
    }
  }

  Future<List<dynamic>> getRecomByArtistName(String artistName) async {
    final response = await http
        .get(Uri.parse('$apiUrl/tracks/recommendations/artist/$artistName'));

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load track');
    }
  }
}
