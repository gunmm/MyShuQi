import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


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
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebviewScaffold(url: "https://www.baidu.com/",
            appBar: AppBar(
              title: Text("111"),
            ),
          );
        }));
      },
      child: Container(
        width: width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Image.network(
                this.widget.novel.imgUrl,
                width: width,
                height: width / 0.75,
                fit: BoxFit.cover,
              ),
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