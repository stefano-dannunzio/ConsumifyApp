import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetRecomByArtistNameScreen extends StatefulWidget {
  const GetRecomByArtistNameScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetRecomByArtistNameScreenState createState() =>
      _GetRecomByArtistNameScreenState();
}

class _GetRecomByArtistNameScreenState
    extends State<GetRecomByArtistNameScreen> {
  final _formKey = GlobalKey<FormState>();
  String _artistName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getRecomByArtistName'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'artist_name'),
              onSaved: (value) => _artistName = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Aquí puedes hacer la solicitud a la API
                  final future =
                      TracksService().getRecomByArtistName(_artistName);
                  Get.to(ApiResponseScreen(
                    future: future,
                    titulo: 'track_name',
                    artista: 'artist_name',
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
