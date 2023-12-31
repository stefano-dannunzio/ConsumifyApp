import 'package:consumify/screens/screens.dart';
import 'package:consumify/utilities/songs_loader.dart';
import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final Song song;

  const SongCard({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
      ),
    );
  }
}
