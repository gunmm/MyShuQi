import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/model/home_model.dart';
import 'home_four_item.dart';
import 'home_section_header.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';
import 'home_two_item.dart';

class HomeSectionStyle2 extends StatelessWidget {

  HomeModule homeModule;
  HomeSectionStyle2(this.homeModule);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var books = homeModule.books;
    if (books.length < 8) {
      return Container();
    }
    List<Widget> children = [];
    children.addAll(homeModule.books.sublist(0, 4).map((novel){
      return HomeFourItem(novel);
    }).toList());
    children.addAll(homeModule.books.sublist(4).map((novel){
      return HomeTwoItem(novel);
    }).toList());
    
    
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