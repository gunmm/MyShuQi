import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/model/home_model.dart';

class HomeMenu extends StatelessWidget {

  final List<MenuInfo> infos;
  HomeMenu(this.infos);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: this.infos.map((info){
          return buildItem(info);
        }).toList(),
      ),
    );
  }


  Widget buildItem(MenuInfo info) {
    return Column(
      children: <Widget>[
        Image.asset(
          info.icon ?? "",
        ),
        SizedBox(height: 5),
        Text(info.title),
      ],
    );
  }
}