import 'package:consumify/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:consumify/services/services.dart';

// ignore: must_be_immutable
class GetAlbumTracksScreen extends StatelessWidget {
  GetAlbumTracksScreen({super.key});

  final AlbumService _albumTracksService = AlbumService();
  final _formKey = GlobalKey<FormState>();
  String _id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Album Tracks'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Id del album'),
                  onSaved: (value) => _id = value!,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final future = _albumTracksService.getAlbumTracks(_id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApiResponseScreen(
                                    future: future,
                                    titulo: 'track_name',
                                    artista: 'artist_name',
                                  )));
                    }
                  },
                  child: const Text('Send'),
                )
              ],
            )));
  }
}
