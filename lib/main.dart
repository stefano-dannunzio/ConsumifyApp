import 'package:consumify/screens/screens.dart';
import 'package:consumify/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "demo",
      debugShowCheckedModeBanner: false,
      theme: GlobalTheme.themeData,
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
        "songList": (context) => const SonglistScreen(),
      },
    );
  }
}
