import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetPlaylistScreen extends StatefulWidget {
  const GetPlaylistScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetPlaylistScreenState createState() => _GetPlaylistScreenState();
}

class _GetPlaylistScreenState extends State<GetPlaylistScreen> {
  final _formKey = GlobalKey<FormState>();
  String _idPlaylist = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getPlaylist'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Playlist_id'),
                onSaved: (value) => _idPlaylist = value!,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Aquí puedes hacer la solicitud a la API
                  final future = PlaylistService().getPlaylist(_idPlaylist);
                  Get.to(GetPlaylistResponseScreen(
                    future: future,
                    titulo: 'nombrePlaylist',
                    creador: 'creador',
                    image: 'imagenPlaylist',
                    id: 'id',
                  ));
                }
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
