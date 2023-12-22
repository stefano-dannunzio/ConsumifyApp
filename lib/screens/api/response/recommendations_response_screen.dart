import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class RecommendationsResponseScreen extends StatelessWidget {
  final Future<List<dynamic>> future;
  final String trackName;
  final String artistName;

  const RecommendationsResponseScreen({
    Key? key,
    required this.future,
    required this.trackName,
    required this.artistName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final recommendations = snapshot.data!;
          return Column(
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
                              Text(recommendation[trackName],
                                  style: TextStyle(fontSize: 24),
                                  textAlign: TextAlign.center),
                              Text(recommendation[artistName],
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        }
      },
    );
  }
}
