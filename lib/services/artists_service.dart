import 'package:http/http.dart' as http;
import 'dart:convert';

class ArtistService {
  final String apiUrl = 'http://consumify-api.onrender.com';
  String? currentId;
  String currentImage = '';

  // Singleton
  static final ArtistService _instance = ArtistService._internal();

  factory ArtistService() {
    return _instance;
  }

  ArtistService._internal();

  // Nuevo método para establecer currentId
  void setArtistId(String id) {
    currentId = id;
  }

  Future<List<dynamic>> getArtist(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/artists/$id'));

    if (response.statusCode == 200) {
      setArtistId(id);
      final artist = {
        'nombreArtista': jsonDecode(response.body)['nombreArtista'],
        'imagenArtista': jsonDecode(response.body)['imagenArtista'],
      };
      return [artist];
    } else {
      throw Exception('Failed to load artist album');
    }
  }

  Future<List<dynamic>> getArtistAlbums() async {
    // Verificar si currentId no es nulo antes de hacer la solicitud
    if (currentId != null) {
      try {
        final response = await http
            .get(Uri.parse('$apiUrl/artists/artistaalbum/$currentId'));

        if (response.statusCode == 200) {
          // Limpiar la lista antes de agregar nuevos álbumes
          currentId = null;
          return jsonDecode(response.body);
        } else {
          throw Exception('Failed to load artist albums');
        }
      } catch (e) {
        throw Exception('Error in getArtistAlbums: $e');
      }
    } else {
      throw Exception('currentId is null');
    }
  }
}
