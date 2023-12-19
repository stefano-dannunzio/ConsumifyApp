import 'package:consumify/utilities/songs_loader.dart';
import 'package:consumify/widgets/song_card.dart';
import 'package:flutter/material.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  final List<Song> songs = []; // Aquí se cargarán las canciones
  final List<String> artists = []; // Aquí se cargarán los artistas
  String? selectedArtist;

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  void _loadSongs() async {
    final List<Song> loadedSongs = await loadSongs();
    setState(() {
      songs.addAll(loadedSongs);
      artists.addAll(loadedSongs.map((song) => song.artist).toSet().toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artistas'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedArtist,
            items: artists.map((artist) {
              return DropdownMenuItem<String>(
                value: artist,
                child: Text(artist),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedArtist = value;
              });
            },
          ),
          Expanded(
            child: ListView(
              children: songs
                  .where((song) => song.artist == selectedArtist)
                  .map((song) => SongCard(song: song))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
