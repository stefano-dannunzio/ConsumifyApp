import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetRecommendationsScreen extends StatefulWidget {
  const GetRecommendationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetRecommendationsScreenState createState() =>
      _GetRecommendationsScreenState();
}

class _GetRecommendationsScreenState extends State<GetRecommendationsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _seedGenres = '';
  String _seedArtists = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getRecommendations'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'seed_genres'),
              onSaved: (value) => _seedGenres = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'seed_artists'),
              onSaved: (value) => _seedArtists = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Aquí puedes hacer la solicitud a la API
                  final future = TracksService()
                      .getRecommendations(_seedGenres, _seedArtists);
                  Get.to(RecommendationsResponseScreen(
                      future: future,
                      trackName: 'track_name',
                      artistName: 'artist_name'));
                }
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
