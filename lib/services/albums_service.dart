import 'package:http/http.dart' as http;
import 'dart:convert';

class AlbumService {
  final String apiUrl = 'http://consumify-api.onrender.com';

  Future<List<dynamic>> getAlbum(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/album/$id'));

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<dynamic>> getAlbumTracks(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/album/albumTracks/$id'));

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load album tracks');
    }
  }
}
