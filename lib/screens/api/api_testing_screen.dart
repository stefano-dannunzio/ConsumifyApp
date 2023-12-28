import 'package:flutter/material.dart';
import 'package:consumify/screens/screens.dart';
import 'package:get/get.dart';

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
                Get.to(const GetRecommendationsScreen());
              },
            ),
            ListTile(
              title: const Text('getRecomByArtistName'),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
                Get.to(const GetRecomByArtistNameScreen());
              },
            ),
            ListTile(
              title: const Text('getRecomById'),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
                Get.to(const GetRecomByIdScreen());
              },
            ),
            ListTile(
              title: const Text('getPlaylist'),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
                Get.to(GetPlaylistScreen());
              },
            ),
            ListTile(
              title: const Text('getPlaylistTracksByArtist'),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
                Get.to(PlaylistTracksArtist());
              },
            ),
            ListTile(
              title: const Text('getAlbum'),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
                Get.to(const GetAlbumScreen());
              },
            ),
            ListTile(
              title: const Text('getArtistAlbums'),
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
                Get.to(const GetArtistAlbumsScreen());
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
