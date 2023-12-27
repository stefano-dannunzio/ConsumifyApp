import 'package:http/http.dart' as http;
import 'dart:convert';

class PlaylistService {
  final String apiUrl = 'http://consumify-api.onrender.com';

  Future<List<dynamic>> getPlaylistTracks(String idPlaylist) async {
    final Uri uri =
      Uri.parse('https://maxiozonas-consumify.onrender.com/playlist/playlistTracks/$idPlaylist');

    final response = await http.get(uri);
    
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return (jsonDecode(response.body) as Map<String, dynamic>)['tracks']
          as List<dynamic>;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

  Future<List<dynamic>> getPlaylistTracksArtist(String idPlaylist, String idArtist) async {
    final Uri uri =
      Uri.parse('https://maxiozonas-consumify.onrender.com/playlist/$idPlaylist/playlistTracks/artist?artistId=$idArtist');

    final response = await http.get(uri);
    
    if (response.statusCode == 200) {
      print('Response body ARTIST: ${response.body}');
      return (jsonDecode(response.body) as Map<String, dynamic>)['canciones']
          as List<dynamic>;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

 
}


