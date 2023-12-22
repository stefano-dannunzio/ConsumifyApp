import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';

class GetArtistAlbumsScreen extends StatefulWidget {
  const GetArtistAlbumsScreen({super.key});

  @override
  _GetArtistAlbumsScreenState createState() => _GetArtistAlbumsScreenState();
}

class _GetArtistAlbumsScreenState extends State<GetArtistAlbumsScreen> {
  final _formkey = GlobalKey<FormState>();
  String idArtista = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Get Artist Albums'),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Artist ID',
                ),
                onSaved: (value) => idArtista = value!,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    final future = ArtistService().getArtistAlbum(idArtista);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApiResponseScreen(
                          future: future,
                          titulo: 'nombreAlbum',
                          artista: 'nombreArtista',
                        ),
                      ),
                    );
                  }
                },
                child: Text('Get Artist Albums'),
              ),
            ],
          ),
        ));
  }
}
