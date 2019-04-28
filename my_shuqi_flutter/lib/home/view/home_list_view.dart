import 'package:flutter/material.dart';

enum HomeListType {
  excellent,
  male,
  female,
  cartoon
}

class HomeListView extends StatefulWidget {
  final HomeListType type;
  HomeListView(this.type);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeListViewState();
  }
}

class HomeListViewState extends State<HomeListView> {

  void loadData() {

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(this.widget.type.toString()),
    );
  }
}