import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetArtistScreen extends StatefulWidget {
  const GetArtistScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetArtistScreenState createState() => _GetArtistScreenState();
}

class _GetArtistScreenState extends State<GetArtistScreen> {
  final _formkey = GlobalKey<FormState>();
  String idArtista = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Artist'),
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
                    final future = ArtistService().getArtist(idArtista);
                    Get.to(ArtistResponseScreen(
                      future: future,
                      nombre: 'nombreArtista',
                      img: 'imagenArtista',
                    ));
                  }
                },
                child: const Text('Get Artist'),
              ),
            ],
          ),
        ));
  }
}
