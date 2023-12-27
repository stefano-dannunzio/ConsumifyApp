import 'package:consumify/screens/api/response/artistalbums_response_screen.dart';
import 'package:flutter/material.dart';
import 'package:consumify/services/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistResponseScreen extends StatefulWidget {
  final Future<List<dynamic>> future;
  final String nombre;
  final String img;

  const ArtistResponseScreen({
    super.key,
    required this.future,
    required this.nombre,
    required this.img,
  });

  @override
  _ArtistResponseScreenState createState() => _ArtistResponseScreenState();
}

class _ArtistResponseScreenState extends State<ArtistResponseScreen> {
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
            final nombreArtista = snapshot.data![0]['nombreArtista'];
            final imagenArtista = snapshot.data![0]['imagenArtista'];

            return Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  imagenArtista,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.6),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 200.0),
                        child: Text(
                          nombreArtista,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      ElevatedButton(
                        onPressed: () {
                          final future = ArtistService().getArtistAlbums();
                          Get.to(ArtistAlbumsResponseScreen(
                            future: future,
                            nombreAlbum: 'nombreAlbum',
                            id: 'idAlbum',
                            fechaLanzamiento: 'fechaLanzamiento',
                            cantCanciones: 'cantidadCanciones',
                            imgAlbum: 'imagenAlbum',
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 40.0,
                          ),
                          primary: Color.fromARGB(255, 30, 215, 96),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4.0,
                        ),
                        child: Text(
                          'Albumes',
                          style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
