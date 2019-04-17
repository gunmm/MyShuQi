import 'package:flutter/material.dart';

import 'package:my_shuqi_flutter/utils/public_head.dart';

class BookshelfHeader extends StatefulWidget {
  final Novel novel;
  BookshelfHeader(this.novel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookshelfHeaderState();
  }
}

class BookshelfHeaderState extends State<BookshelfHeader> {
  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    var bgHeight = width / 0.9;
    var height = Screen.topSafeHeight + 250;
    // TODO: implement build
    return Container(
      width: width,
      height: height,
      color: Colors.red,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Image.asset(
              "images/bookshelf_bg.png",
              width: width,
              height: bgHeight,
              fit: BoxFit.cover,
            ),
            top: height-bgHeight,
          ),

          Positioned(
            bottom: 0,
              child: Image.asset(
                "images/bookshelf_cloud_0.png",
                width: width,
                height: bgHeight,
                fit: BoxFit.cover,
              ),
          ),

          Container(
            margin: EdgeInsets.only(top: Screen.topSafeHeight+50, left: 15, right: 15, bottom: 0),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: new Border.all(color: Colors.white),
                  ),
                  child: Image.network(
                    this.widget.novel.imgUrl,
                    width: 120,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(this.widget.novel.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text("读至0.2%",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text("继续阅读",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 3),
                        Image.asset('images/bookshelf_continue_read.png')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}