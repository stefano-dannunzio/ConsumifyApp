import 'package:flutter/material.dart';
import 'package:consumify/screens/screens.dart';

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetAlbumTracksScreen()),
                      );
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
