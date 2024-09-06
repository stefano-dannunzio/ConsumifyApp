import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetArtistAlbumsScreen extends StatefulWidget {
  final String? artistId;

  const GetArtistAlbumsScreen({super.key, this.artistId});

  @override
  _GetArtistAlbumsScreenState createState() => _GetArtistAlbumsScreenState();
}

class _GetArtistAlbumsScreenState extends State<GetArtistAlbumsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _id = '';

  @override
  void initState() {
    super.initState();
    if (widget.artistId != null) {
      _id = widget.artistId!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navigateToIntermediateScreen();
      });
    }
  }

  void _navigateToIntermediateScreen() {
    final future = ArtistService().getArtistAlbum(_id);
    Get.to(ArtistIntermediateResponseScreen(
      future: future,
      titulo: 'nombreAlbum',
      artista: 'nombreArtista',
      image: 'imagenAlbum',
      id: 'idAlbum',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Artist Albums'),
      ),
      body: widget.artistId == null
          ? Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Artist ID'),
                    initialValue: _id,
                    onSaved: (value) => _id = value!,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter an ID' : null,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_id.isEmpty && widget.artistId == null) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        } else {
                          return;
                        }
                      }
                      _navigateToIntermediateScreen();
                    },
                    child: const Text('Get Artist Albums'),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
