import 'package:consumify/screens/api/response/api_response_screen.dart';
import 'package:consumify/services/albums_service.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistAlbumsResponseScreen extends StatefulWidget {
  final Future<List<dynamic>> future;
  final String nombreAlbum;
  final String id;
  final String fechaLanzamiento;
  final String cantCanciones;
  final String imgAlbum;
  final String? precisionFecha;

  const ArtistAlbumsResponseScreen(
      {super.key,
      required this.future,
      required this.nombreAlbum,
      required this.id,
      required this.fechaLanzamiento,
      required this.cantCanciones,
      required this.imgAlbum,
      this.precisionFecha});

  @override
  // ignore: library_private_types_in_public_api
  _ArtistAlbumsResponseScreenState createState() =>
      _ArtistAlbumsResponseScreenState();
}

class _ArtistAlbumsResponseScreenState
    extends State<ArtistAlbumsResponseScreen> {
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
            final recommendations = snapshot.data!;
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(height: 400),
                    items: recommendations.map((recommendation) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Card(
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.network(
                                    recommendation[widget.imgAlbum],
                                    width: 250,
                                    height: 250,
                                  ),
                                  Text(recommendation[widget.nombreAlbum],
                                      style: TextStyle(fontSize: 30),
                                      textAlign: TextAlign.center),
                                  Text(recommendation[widget.fechaLanzamiento],
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                      height:
                                          20.0), // Espaciado entre el texto y el botón
                                  ElevatedButton(
                                    onPressed: () {
                                      final future = AlbumService()
                                          .getAlbumTracks(
                                              snapshot.data![0][widget.id]);
                                      Get.to(ApiResponseScreen(
                                        future: future,
                                        titulo: 'track_name',
                                        artista: 'artist_name',
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 4.0,
                                    ),
                                    child: Text(
                                      'Ver album tracks',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: const TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
