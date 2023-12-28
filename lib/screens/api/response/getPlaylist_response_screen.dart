import 'package:flutter/material.dart';
import 'package:consumify/screens/screens.dart';
import 'package:get/get.dart';
import 'package:consumify/services/services.dart';

class GetPlaylistResponseScreen extends StatefulWidget {
  final Future<List<dynamic>> future;
  final String titulo;
  final String creador;
  final String image;
  final String id;
  //final int totalCanciones;

  const GetPlaylistResponseScreen(
      {super.key,
      required this.future,
      required this.titulo,
      required this.creador,
      required this.id,
      required this.image,
      //required this.totalCanciones
      });

  @override
  // ignore: library_private_types_in_public_api
  _GetPlaylistResponseScreenState createState() =>
      _GetPlaylistResponseScreenState();
}

class _GetPlaylistResponseScreenState
    extends State<GetPlaylistResponseScreen> {
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
                      final future = PlaylistService().getPlaylistTracks(snapshot.data![index][widget.id]);
                      Get.to(ApiResponseScreen(
                        future: future,
                        titulo: 'nombreCancion',
                        artista: 'artistas',
                        imagen: 'imagenCancion',
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          snapshot.data![index][widget.image],
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          snapshot.data![index][widget.titulo],
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5), 
                        Text(
                          snapshot.data![index][widget.creador],
                          style: TextStyle(fontSize: 18),
                        ),
                      ]
                    )
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
