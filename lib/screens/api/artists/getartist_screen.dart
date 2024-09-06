import 'package:consumify/screens/api/response/artist_response_screen.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetArtistScreen extends StatefulWidget {
  const GetArtistScreen({super.key});

  @override
  _GetArtistScreenState createState() => _GetArtistScreenState();
}

class _GetArtistScreenState extends State<GetArtistScreen> {
  final _formKey = GlobalKey<FormState>();
  String _id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Artist'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Artist ID'),
              onSaved: (value) => _id = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Llamar al servicio para obtener la información del artista
                  final future = ArtistService().getArtist(_id);
                  Get.to(ArtistResponseScreen(
                    future: future,
                    titulo: 'nombreArtista',
                    image: 'imagenArtista',
                    artistId: _id,
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
