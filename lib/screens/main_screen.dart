import 'package:consumify/screens/screens.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const SonglistScreen(),
    const ArtistScreen(),
    // Agrega ArtistScreen aquí si ya lo has implementado
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Lista de canciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Artistas',
          ),
          // Agrega un ítem para ArtistScreen aquí si ya lo has implementado
        ],
      ),
    );
  }
}
