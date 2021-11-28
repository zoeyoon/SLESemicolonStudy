import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title), 
        ),
        body: Image.network('https://picsum.photos/250?image=9'), //이미지를 인터넷에서 부터 불러와 출력
      ),
    );
  }
}