import 'package:flutter/material.dart';

class ApiResponseScreen extends StatefulWidget {
  final Future<List<dynamic>> future;
  final String titulo;
  final String artista;
  final String? playlistName;
  final String? imagen;

  const ApiResponseScreen(
      {super.key,
      required this.future,
      required this.titulo,
      required this.artista,
      this.playlistName,
      this.imagen});

  @override
  // ignore: library_private_types_in_public_api
  _ApiResponseScreenState createState() => _ApiResponseScreenState();
}

class _ApiResponseScreenState extends State<ApiResponseScreen> {
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
                print(snapshot.data![index]);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data![index][widget.imagen]),
                    radius: 30,
                  ),
                  title: Text(snapshot.data![index][widget.titulo]),
                  subtitle: Text(snapshot.data![index][widget.artista]),

                );
              },
            );
          }
        },
      ),
    );
  }
}
