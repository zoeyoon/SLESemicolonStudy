import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Fade in images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Stack(
          children: <Widget>[
            //const Center(child: CircularProgressIndicator()), //로딩될때 보여지는 동그라미
            Center(
              /*child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://picsum.photos/250?image=9',
              ),*/
              child: FadeInImage.assetNetwork(
                placeholder: 'image/loading.gif',
                image: 'https://picsum.photos/250?image=9'
              )
            ),
          ],
        ),
      ),
    );
  }
}
