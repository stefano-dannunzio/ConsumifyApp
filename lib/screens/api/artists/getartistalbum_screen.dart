import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetArtistAlbumsScreen extends StatefulWidget {
  const GetArtistAlbumsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetArtistAlbumsScreenState createState() => _GetArtistAlbumsScreenState();
}

class _GetArtistAlbumsScreenState extends State<GetArtistAlbumsScreen> {
  final _formkey = GlobalKey<FormState>();
  String idArtista = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Artist Albums'),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Artist ID',
                ),
                onSaved: (value) => idArtista = value!,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    final future = ArtistService().getArtistAlbum(idArtista);
                    Get.to(ApiResponseScreen(
                      future: future,
                      titulo: 'nombreAlbum',
                      artista: 'nombreArtista',
                    ));
                  }
                },
                child: const Text('Get Artist Albums'),
              ),
            ],
          ),
        ));
  }
}
