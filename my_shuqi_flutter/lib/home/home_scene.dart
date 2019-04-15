import 'package:flutter/material.dart';

class HomeScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeSceneState();
}

class HomeSceneState extends State<HomeScene> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}