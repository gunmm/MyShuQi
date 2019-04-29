import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';

class HomeTwoItem extends StatelessWidget {
  final Novel novel;
  HomeTwoItem(this.novel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width = (Screen.width - 15*3) / 2;
    return Container(
      width: width,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Image.network(novel.imgUrl??"",
            width: 50,
            height: 66,
          ),

          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(novel.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(novel.recommendNum,
                    style: TextStyle(
                      fontSize: 14,
                      color: SQColor.lightGray,
                    ),
                  ),
                ],
              ),
            ),

          ),
        ],
      ),
    );
  }
}