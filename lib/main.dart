import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Consumify'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListScreen(),
                  ),
                );
              },
              child: Text('Go to List Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  Future<List<Map<String, dynamic>>> loadSongs() async {
    // Load the JSON data from your source, e.g., a file or API call
    String jsonString = await rootBundle.loadString('assets/JSONS/songs.json');

    // Decode the JSON
    List<Map<String, dynamic>> loadedSongs = json.decode(jsonString);

    return loadedSongs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: loadSongs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error loading songs: ${snapshot.error}');
            } else {
              final songs = snapshot.data as List<Map<String, dynamic>>;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        final song = songs[index];
                        return ListTile(
                          title: Text(song['name']),
                          subtitle: Text(song['artist']),
                          trailing: Text(song['album']['name']),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
