import 'package:flutter/material.dart';
import 'root_scene.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';


class AppScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "myShuQi",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: SQColor.paper,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        textTheme: TextTheme(body1: TextStyle(color: SQColor.darkGray))
      ),

      home: RootScene(),
    );
  }
}