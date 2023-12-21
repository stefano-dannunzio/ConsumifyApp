import 'package:consumify/screens/api/playlists_screen.dart';
import 'package:flutter/material.dart';
import 'package:consumify/screens/screens.dart';

class ApiTestingScreen extends StatefulWidget {
  const ApiTestingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ApiTestingScreenState createState() => _ApiTestingScreenState();
}

class _ApiTestingScreenState extends State<ApiTestingScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('API Testing'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('API Testing'),
            ),
            ListTile(
              title: const Text('getRecommendations'),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetRecommendationsScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('getPlaylistTracks'),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaylistTracksScreen()),
                );
              },
            ),
            // Agrega más ListTiles para otros métodos de la API
          ],
        ),
      ),
      body: const Center(
        child: Text('Select a method from the drawer'),
      ),
    );
  }
}
