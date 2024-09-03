import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtistService {
  final String apiUrl = 'https://consumify-api.onrender.com';
  String ayudin = '';

  Future<List<dynamic>> getArtistAlbum(String id) async {
    final response =
        await http.get(Uri.parse('$apiUrl/artists/artistaalbum/$id'));

    ayudin = id;

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load artist album');
    }
  }
}
