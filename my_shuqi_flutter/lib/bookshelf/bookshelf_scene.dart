import 'package:flutter/material.dart';

class BookshelfScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookshelfSceneState();
}

class BookshelfSceneState extends State<BookshelfScene> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text("书架"),
      ),
    );
  }
}