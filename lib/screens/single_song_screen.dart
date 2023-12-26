import 'package:flutter/material.dart';
import 'package:consumify/utilities/songs_loader.dart';

class SingleSongScreen extends StatelessWidget {
  final Song song;

  const SingleSongScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Título: ${song.title}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Artista: ${song.artist}'),
            Text('Álbum: ${song.album}'),
            Text('Género: ${song.genre}'),
          ],
        ),
      ),
    );
  }
}
