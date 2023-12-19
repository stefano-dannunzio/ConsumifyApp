import 'package:consumify/screens/single_song_screen.dart';
import 'package:consumify/utilities/songs_loader.dart';
import 'package:flutter/material.dart';

class SonglistScreen extends StatefulWidget {
  const SonglistScreen({Key? key}) : super(key: key);

  @override
  _SonglistScreenState createState() => _SonglistScreenState();
}

class _SonglistScreenState extends State<SonglistScreen> {
  Future<List<Song>>? futureSongs;

  @override
  void initState() {
    super.initState();
    futureSongs = loadSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de canciones'),
      ),
      body: FutureBuilder<List<Song>>(
        future: futureSongs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text('Error al cargar las canciones');
          } else {
            return ListView(
              children: snapshot.data!.map((song) {
                return ListTile(
                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleSongScreen(song: song),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
