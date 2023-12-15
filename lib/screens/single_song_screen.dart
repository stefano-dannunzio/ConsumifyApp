import 'package:flutter/material.dart';
import '../widgets/songCard.dart';

class SingleSongScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Song Screen'),
      ),
      backgroundColor: const Color.fromARGB(255, 5, 222, 34),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // children: [ ACA IRIA LA CARD SI TAN SOLO FUNCIONARA DEAAA
        //   SongCard(
        //     songName: 'hola asd',
        //     artistName: 'holaasd asdasd',
        //     albumName: 'hola asdasdasd',
        //   ), */
        // ],
      ),
    );
  }
}
