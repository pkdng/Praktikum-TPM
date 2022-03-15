import 'package:flutter/material.dart';

class ListLagu extends StatelessWidget {
  final String albumName, singer, releaseDate, source, imageUrls, albumurl;
  // final songs = [];

  const ListLagu(
      {Key? key,
        required this.albumName,
        required this.singer,
        required this.releaseDate,
        required this.source,
        required this.imageUrls,
        required this.albumurl,
        // required this.songs
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$albumName")
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image.network(imageUrls),
              Text("$albumName"),
              Text("$singer"),
              Text("$releaseDate | $source")
            ],
          ),
        ),
      ),
    );
  }
}
