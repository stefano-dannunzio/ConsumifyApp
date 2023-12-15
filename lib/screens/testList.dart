import 'package:flutter/material.dart';

class Song {
  final String title;
  final String subtitle;

  Song({
    required this.title,
    required this.subtitle,
  });
}

class TestList extends StatelessWidget {
  const TestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de canciones'),
      ),
      body: ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (context, index) {
          final song = _songs[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/singleSong',
              arguments: song,
            ),
            child: ListTile(
              title: Text(song!.title),
              subtitle: Text(song.subtitle),
            ),
          );
        },
      ),
    );
  }
}

Map<String, Song> _songs = {
  '1': Song(title: "MESSI TE AMO", subtitle: "La canción del crack"),
  '2': Song(title: "La Bamba", subtitle: "El clásico de Ritchie Valens"),
  '3':
      Song(title: "Hey Jude", subtitle: "La canción más famosa de The Beatles"),
  '4': Song(title: "Bohemian Rhapsody", subtitle: "La obra maestra de Queen"),
  '5': Song(title: "Imagine", subtitle: "El himno de paz de John Lennon"),
  '6': Song(title: "Dancing Queen", subtitle: "El hit de ABBA"),
  '7': Song(
      title: "I Will Survive",
      subtitle: "El himno de empoderamiento de Gloria Gaynor"),
  '8': Song(
      title: "Thriller", subtitle: "El éxito más popular de Michael Jackson"),
  '9': Song(title: "Sweet Caroline", subtitle: "El himno de los Red Sox"),
  '10': Song(title: "Lose Yourself", subtitle: "El tema de la película 8 Mile"),
  '11': Song(
      title: "Can't Stop the Feeling!",
      subtitle: "El éxito de Justin Timberlake"),
  '12': Song(
      title: "Despacito",
      subtitle: "El éxito mundial de Luis Fonsi y Daddy Yankee"),
  '13': Song(title: "Bad Guy", subtitle: "El éxito de Billie Eilish"),
  '14': Song(title: "Blinding Lights", subtitle: "El éxito de The Weeknd"),
  '15': Song(
      title: "Montero (Call Me by Your Name)",
      subtitle: "El éxito de Lil Nas X"),
  '16': Song(title: "As It Was", subtitle: "El éxito de Harry Styles"),
  '17': Song(title: "Heat Waves", subtitle: "El éxito de Glass Animals"),
  '18': Song(title: "Enemy", subtitle: "El éxito de Imagine Dragons y JID"),
  '19': Song(title: "Levitating", subtitle: "El éxito de Dua Lipa"),
  '20':
      Song(title: "Up", subtitle: "El éxito de Cardi B y Megan Thee Stallion"),
};
