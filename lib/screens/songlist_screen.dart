import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SonglistScreen extends StatelessWidget {
  const SonglistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de canciones'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Billie Jean'),
            subtitle: Text('Michael Jackson'),
          ),
          ListTile(
            title: Text('Like a Prayer'),
            subtitle: Text('Madonna'),
          ),
          ListTile(
            title: Text('Video Killed the Radio Star'),
            subtitle: Text('The Buggles'),
          ),
          ListTile(
            title: Text('We Built This City'),
            subtitle: Text('Starship'),
          ),
          ListTile(
            title: Text('Sweet Child o\' Mine'),
            subtitle: Text('Guns N\' Roses'),
          ),
          ListTile(
            title: Text('Like a Virgin'),
            subtitle: Text('Madonna'),
          ),
          ListTile(
            title: Text('Born in the U.S.A.'),
            subtitle: Text('Bruce Springsteen'),
          ),
          ListTile(
            title: Text('99 Red Balloons'),
            subtitle: Text('Nena'),
          ),
          ListTile(
            title: Text('Dancing Queen'),
            subtitle: Text('ABBA'),
          ),
          ListTile(
            title: Text('Don\'t Stop Believin\''),
            subtitle: Text('Journey'),
          ),
          ListTile(
            title: Text('I Want to Break Free'),
            subtitle: Text('Queen'),
          ),
          ListTile(
            title: Text('Livin\' on a Prayer'),
            subtitle: Text('Bon Jovi'),
          ),
          ListTile(
            title: Text('Sweet Caroline'),
            subtitle: Text('Neil Diamond'),
          ),
          ListTile(
            title: Text('We Will Rock You'),
            subtitle: Text('Queen'),
          ),
          ListTile(
            title: Text('I Will Always Love You'),
            subtitle: Text('Whitney Houston'),
          ),
          ListTile(
            title: Text('Material Girl'),
            subtitle: Text('Madonna'),
          ),
        ],
      ),
    );
  }
}
