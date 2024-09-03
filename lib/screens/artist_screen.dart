import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});

  @override
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  final _formKey = GlobalKey<FormState>();
  String _id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getArtist'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Artist_id'),
              onSaved: (value) => _id = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Here you can make the request to the API
                  final future = ArtistService().getArtistAlbum(_id);
                  Get.to(ArtistIntermediateResponseScreen(
                    future: future,
                    titulo: 'nombreAlbum',
                    artista: 'nombreArtista',
                    image: 'imagenAlbum',
                    id: 'idAlbum',
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
