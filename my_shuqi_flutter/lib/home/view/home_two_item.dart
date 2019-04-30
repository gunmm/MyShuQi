import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';

class HomeTwoItem extends StatelessWidget {
  final Novel novel;
  HomeTwoItem(this.novel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width = (Screen.width - 15*3) / 2;
    return GestureDetector(
      onTap: (){
        print("tapAct");
      },
      child: Container(
        width: width,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x22000000),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Image.network(novel.imgUrl??"",
                width: 50,
                height: 66,
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(novel.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2,),
                    Text(novel.recommendNum,
                      style: TextStyle(
                        fontSize: 14,
                        color: SQColor.gray,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}