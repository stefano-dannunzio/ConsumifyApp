import 'package:flutter/material.dart';
import 'package:consumify/screens/screens.dart';
import 'package:get/get.dart';
import 'package:consumify/services/services.dart';

class ApiIntermediateResponseScreen extends StatefulWidget {
  final Future<List<dynamic>> future;
  final String titulo;
  final String artista;
  final String id;

  const ApiIntermediateResponseScreen(
      {super.key,
      required this.future,
      required this.titulo,
      required this.artista,
      required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _ApiIntermediateResponseScreenState createState() =>
      _ApiIntermediateResponseScreenState();
}

class _ApiIntermediateResponseScreenState
    extends State<ApiIntermediateResponseScreen> {
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
                      //crear objeto future con el id del album
                      final future = AlbumService()
                          .getAlbumTracks(snapshot.data![index][widget.id]);
                      Get.to(ApiResponseScreen(
                        future: future,
                        titulo: 'track_name',
                        artista: 'artist_name',
                      ));
                    },
                    child: ListTile(
                      title: Text(snapshot.data![index][widget.titulo]),
                      subtitle: Text(snapshot.data![index][widget.artista]),
                      // Add more fields as necessary
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
