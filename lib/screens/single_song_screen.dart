import 'package:flutter/material.dart';

class SingleSongScreen extends StatefulWidget {
  const SingleSongScreen({super.key, required this.song});

  final Song song;

  @override
  // ignore: library_private_types_in_public_api
  _SingleSongScreenState createState() => _SingleSongScreenState();
}

class _SingleSongScreenState extends State<SingleSongScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
      ),
      body: Center(
        child: Column(children: [
          Text('${widget.song.artist} - ${widget.song.album}'),
          Text(widget.song.genre)
        ]),
      ),
    );
  }
}

class Song {
  final String title;
  final String artist;
  final String album;
  final String genre;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.genre,
  });

  @override
  String toString() {
    return 'Song(titulo: $title, artista: $artist, album: $album, genre: $genre)';
  }
}
