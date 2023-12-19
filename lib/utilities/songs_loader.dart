import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<Song>> loadSongs() async {
  final String contents =
      await rootBundle.loadString('assets/JSONS/songs.json');
  final List<dynamic> json = jsonDecode(contents);
  return json.map((item) => Song.fromJson(item)).toList();
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

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      genre: json['genre'],
    );
  }
}
