import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

class RecommendationsResponseScreen extends StatefulWidget {
  final Future<List<dynamic>> future;
  final String trackName;
  final String artistName;
  final String albumImgUrl;
  final String? audioUrl;

  const RecommendationsResponseScreen({
    super.key,
    required this.future,
    required this.trackName,
    required this.artistName,
    required this.albumImgUrl,
    required this.audioUrl,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RecommendationsResponseScreenState createState() =>
      _RecommendationsResponseScreenState();
}

class _RecommendationsResponseScreenState
    extends State<RecommendationsResponseScreen> {
  AudioPlayer? _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
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
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  recommendation[widget.albumImgUrl],
                                  width: 250,
                                  height: 250,
                                ),
                                Text(recommendation[widget.trackName],
                                    style: const TextStyle(fontSize: 24),
                                    textAlign: TextAlign.center),
                                Text(recommendation[widget.artistName],
                                    style: const TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center),
                                if (recommendation[widget.audioUrl] != null)
                                  ElevatedButton(
                                    onPressed: () async {
                                      await _player!.stop();

                                      await _player!.setUrl(
                                          recommendation[widget.audioUrl]);
                                      _player!.play();
                                    },
                                    child: const Text('Play'),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
