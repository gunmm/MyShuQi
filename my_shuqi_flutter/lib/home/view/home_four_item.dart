import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';

class HomeFourItem extends StatefulWidget {
  final Novel novel;
  HomeFourItem(this.novel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeFourItemState();
  }
}

class HomeFourItemState extends State<HomeFourItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width = (Screen.width - 15*5) / 4;
    return GestureDetector(
      onTap: (){
        print("tapAct");
      },
      child: Container(
        width: width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              this.widget.novel.imgUrl,
              width: width,
              height: width / 0.75,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5,),
            Text(this.widget.novel.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4,),
            Text(this.widget.novel.authorName,
              style: TextStyle(
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );

  }
}