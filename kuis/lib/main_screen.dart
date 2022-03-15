import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'top_album.dart';
import 'list_lagu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spoti-Pay")
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final TopAlbum album = topAlbumList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListLagu(
                    albumName: album.albumName,
                    singer: album.singer,
                    releaseDate: album.releaseDate,
                    source: album.source,
                    imageUrls: album.imageUrls,
                    albumurl: album.albumurl,
                    // songs: album.songs[],
                );
              }));
            },
            child: Card(
              child: Row(
                children: [
                  Image.network(album.imageUrls)
                ],
              ),
            ),
          );
        },
        itemCount: topAlbumList.length),
    );
  }
}