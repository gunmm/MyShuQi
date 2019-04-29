import 'package:flutter/material.dart';
import 'home_section_header.dart';
import 'package:my_shuqi_flutter/model/home_model.dart';
import 'home_four_item.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';

class HomeSectionStyle1 extends StatelessWidget {

  HomeModule homeModule;
  HomeSectionStyle1(this.homeModule);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (homeModule.books.length == 0) {
      return Container();
    }

    var children = homeModule.books.map((novel) {
      return HomeFourItem(novel);
    }).toList();
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          HomeSectionHeader(homeModule.name),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: children,
          ),
          Container(
            color: SQColor.lightGray,
            height: 10,
            margin: EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }

}
