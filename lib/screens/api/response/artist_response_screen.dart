import 'package:consumify/screens/api/artists/getartistalbum_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistResponseScreen extends StatelessWidget {
  final Future<Map<String, dynamic>> future;
  final String titulo;
  final String image;
  final String artistId; // Asegúrate de que este parámetro esté presente

  const ArtistResponseScreen({
    Key? key,
    required this.future,
    required this.titulo,
    required this.image,
    required this.artistId, // Asegúrate de que este parámetro esté presente
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  data[image],
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.6),
                  colorBlendMode: BlendMode.darken,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data[titulo],
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(GetArtistAlbumsScreen(
                            artistId: artistId,
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          backgroundColor:
                              const Color.fromARGB(255, 30, 215, 96),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Get Artist Albums',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data found.'));
          }
        },
      ),
    );
  }
}
