import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';

class BookshelfItemView extends StatelessWidget {
  final Novel novel;

  BookshelfItemView(this.novel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var width = (Screen.width - 4 * 15) / 3;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        child: Column(
          children: <Widget>[
            Image.network(
              novel.imgUrl,
              width: width,
              height: width / 0.75,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(novel.name,
              style: TextStyle(
                fontSize: 14
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
//            SizedBox(height: 25),


          ],
        ),
      ),
    );
  }
}
