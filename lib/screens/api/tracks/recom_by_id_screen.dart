import 'package:consumify/screens/screens.dart';
import 'package:consumify/services/services.dart';
import 'package:flutter/material.dart';

class GetRecomByIdScreen extends StatefulWidget {
  const GetRecomByIdScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetRecomByIdScreenState createState() => _GetRecomByIdScreenState();
}

class _GetRecomByIdScreenState extends State<GetRecomByIdScreen> {
  final _formKey = GlobalKey<FormState>();
  String _id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getRecomByIdScreen'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'recommendation_id'),
              onSaved: (value) => _id = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Aquí puedes hacer la solicitud a la API
                  final future = TracksService().getRecomById(_id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApiResponseScreen(
                              future: future,
                              titulo: 'track_name',
                              artista: 'artist_name',
                            )),
                  );
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
