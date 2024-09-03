import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetArtistAlbumsScreen extends StatefulWidget {
  const GetArtistAlbumsScreen({super.key});

  @override
  _GetArtistAlbumsScreenState createState() => _GetArtistAlbumsScreenState();
}

class _GetArtistAlbumsScreenState extends State<GetArtistAlbumsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Artist Albums'),
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
