import 'package:consumify/services/api_service.dart';
import 'package:flutter/material.dart';

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecommendationsScreenState createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  late List<dynamic> _recommendations = [];

  @override
  void initState() {
    super.initState();
    _getRecommendations();
  }

  void _getRecommendations() async {
    _recommendations = await ApiService().getRecommendations();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: ListView.builder(
        itemCount: _recommendations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_recommendations[index]['title']),
            // Añade más campos según sea necesario
          );
        },
      ),
    );
  }
}
