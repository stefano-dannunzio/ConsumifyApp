import 'package:consumify/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:consumify/services/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PlaylistTracksScreen extends StatelessWidget {
  PlaylistTracksScreen({super.key});

  final PlaylistService _playlistService = PlaylistService();
  final _formKey = GlobalKey<FormState>();
  String _idPlaylist = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Playlist Tracks'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Id de la playlist'),
                  onSaved: (value) => _idPlaylist = value!,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final future =
                          _playlistService.getPlaylistTracks(_idPlaylist);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApiResponseScreen(
                                    future: future,
                                    titulo: 'nombreCancion',
                                    artista: 'artistas',
                                    imagen: 'imagenCancion'
                                  )));
                    }
                  },
                  child: const Text('Send'),
                )
              ],
            )));
  }
}
