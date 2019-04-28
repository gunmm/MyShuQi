import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/home/view/home_list_view.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';

class HomeScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeSceneState();
}

class HomeSceneState extends State<HomeScene> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            elevation: 0,
            title: Container(
              child: TabBar(
                labelColor: SQColor.darkGray,
                labelStyle: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelColor: SQColor.gray,
                indicatorColor: SQColor.secondary,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                tabs: [
                  Tab(text: "精选"),
                  Tab(text: "女生"),
                  Tab(text: "男生"),
                  Tab(text: "卡通"),
                ],
              ),
            ),
            backgroundColor: SQColor.white,
          ),
          body: TabBarView(
              children: [
                HomeListView(HomeListType.excellent),
                HomeListView(HomeListType.male),
                HomeListView(HomeListType.female),
                HomeListView(HomeListType.cartoon),
              ],
          ),
        ),
    );
  }
}