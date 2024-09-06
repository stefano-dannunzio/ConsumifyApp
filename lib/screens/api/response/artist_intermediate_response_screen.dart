import 'package:flutter/material.dart';
import 'package:consumify/screens/screens.dart';
import 'package:get/get.dart';
import 'package:consumify/services/services.dart';

class ArtistIntermediateResponseScreen extends StatefulWidget {
  final Future<List<dynamic>> future;
  final String titulo;
  final String artista;
  final String image;
  final String id;

  const ArtistIntermediateResponseScreen(
      {super.key,
      required this.future,
      required this.titulo,
      required this.artista,
      required this.id,
      required this.image});

  @override
  // ignore: library_private_types_in_public_api
  _ArtistIntermediateResponseScreenState createState() =>
      _ArtistIntermediateResponseScreenState();
}

class _ArtistIntermediateResponseScreenState
    extends State<ArtistIntermediateResponseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Response'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: widget.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () async {
                      var albumId = snapshot.data![index][widget.id];
                      var future = AlbumService().getAlbumTracks(albumId);

                      Get.to(ApiResponseScreen(
                        future: future,
                        titulo: 'track_name',
                        artista: 'artist_name',
                      ));
                    },
                    child: ListTile(
                      leading: Image.network(
                        snapshot.data![index][widget.image],
                        width: 100,
                        height: 100,
                      ),
                      title: Text(snapshot.data![index][widget.titulo]),
                      subtitle: Text(snapshot.data![index][widget.artista]),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
