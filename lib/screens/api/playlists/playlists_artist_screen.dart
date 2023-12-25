import 'package:consumify/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:consumify/services/services.dart';

// ignore: must_be_immutable
class PlaylistTracksArtist extends StatelessWidget {
  PlaylistTracksArtist({super.key});

  final PlaylistService _playlistService = PlaylistService();
  final _formKey = GlobalKey<FormState>();
  String _idPlaylist = '';
  String _idArtist = '';

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
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Id del artista'),
                  onSaved: (value) => _idArtist = value!,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final future = _playlistService.getPlaylistTracksArtist(
                          _idPlaylist, _idArtist);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApiResponseScreen(
                                    future: future,
                                    titulo: 'nombreCancion',
                                    artista: 'Artista',
                                  )));
                    }
                  },
                  child: const Text('Send'),
                )
              ],
            )));
  }
}