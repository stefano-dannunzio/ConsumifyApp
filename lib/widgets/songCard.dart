import 'package:flutter/material.dart';
import 'package:consumify/screens/songlist_screen.dart';

class SongCard extends StatelessWidget {
  final String songName;
  final String artistName;
  final String albumName;

  SongCard({
    required this.songName,
    required this.artistName,
    required this.albumName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songName,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 70, 71, 23)),
                ),
                Text(artistName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 70, 71, 23))),
                Text(albumName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 70, 71, 23))),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SonglistScreen()),
                    );
                  },
                  child: const Text('Next song!'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      foregroundColor: const Color.fromARGB(255, 12, 187, 6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
