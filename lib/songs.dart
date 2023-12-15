import 'dart:convert';
import 'package:flutter/services.dart';

Future<void> cargarJson() async {
  String ruta = 'assets/JSONS/songs.json';
  String jsonString = await rootBundle.loadString(ruta);

  // Ahora puedes utilizar jsonString como desees.
  List<dynamic> songs = json.decode(jsonString);
}

class Song {
  final String name;
  final String? id; // Optional ID field
  final String artist;
  final Album album;

  Song({
    required this.name,
    this.id,
    required this.artist,
    required this.album,
  });
}

class Album {
  final String name;
  final String? imageUrl; // Optional image URL

  Album({
    required this.name,
    this.imageUrl,
  });
}
