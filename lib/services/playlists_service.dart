import 'package:http/http.dart' as http;
import 'dart:convert';

class PlaylistService {
  final String apiUrl = 'http://consumify-api.onrender.com';

  Future<List<dynamic>> getPlaylistTracks(String idPlaylist) async {
    final response = await http
        .get(Uri.parse('$apiUrl/playlist/playlistTracks/$idPlaylist'));

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return (jsonDecode(response.body) as Map<String, dynamic>)['tracks']
          as List<dynamic>;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }
}
