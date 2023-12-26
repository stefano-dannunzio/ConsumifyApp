import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetAlbumScreen extends StatefulWidget {
  const GetAlbumScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetAlbumScreenState createState() => _GetAlbumScreenState();
}

class _GetAlbumScreenState extends State<GetAlbumScreen> {
  final _formKey = GlobalKey<FormState>();
  String _id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getAlbum'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Album_id'),
              onSaved: (value) => _id = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Aquí puedes hacer la solicitud a la API
                  final future = AlbumService().getAlbum(_id);
                  Get.to(ApiIntermediateResponseScreen(
                    future: future,
                    titulo: 'Album_name',
                    artista: 'Album_artist',
                    image: 'Album_image',
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
