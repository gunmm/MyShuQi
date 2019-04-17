import 'package:flutter/material.dart';

import 'package:my_shuqi_flutter/utils/public_head.dart';
import 'package:my_shuqi_flutter/bookshelf/view/bookshelf_item_view.dart';
import 'view/bookshelf_header.dart';

class BookshelfScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BookshelfSceneState();
}

class BookshelfSceneState extends State<BookshelfScene> {
  List _favoriteNovels = [];
  ScrollController _scrollController = new ScrollController();
  double _navAlpha = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadData();

    _scrollController.addListener( (){
      var offset = _scrollController.offset;
      if (offset < 0) {
        if (_navAlpha != 0) {
          setState(() {
            _navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          _navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (_navAlpha != 1) {
        setState(() {
          _navAlpha = 1;
        });
      }
    });
  }

  Future<void> _loadData() async {

    List<Novel> favoriteNovels = [];
    List<dynamic> favoriteResponseStr = await Request.get(action: "bookshelf");
    favoriteResponseStr.forEach((data) {
      favoriteNovels.add(Novel.fromJson(data));
    });
    setState(() {
      this._favoriteNovels = favoriteNovels;
    });
  }

  Widget buildTopButtons(Color color) {
    return Row(
        children: <Widget>[
          Container(
            height: kToolbarHeight,
            width: 44,
            child: Image.asset(
                'images/actionbar_checkin.png', color: color),
          ),
          Container(
            height: kToolbarHeight,
            width: 44,
            child: Image.asset(
                'images/actionbar_search.png', color: color),
          ),
          SizedBox(width: 15)
        ]
    );
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          child: Container(
            margin: EdgeInsets.only(top: Screen.topSafeHeight),
            child: buildTopButtons(Colors.white),
          )
        ),
        Opacity(
          opacity: _navAlpha,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, Screen.topSafeHeight, 0, 0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(width: 103),
                Expanded(child: Text("书架",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )
                ),
                buildTopButtons(Colors.black),
              ],
            ),
          ),

        ),
      ],
    );
  }

  Widget buildFavoriteView() {
    List<Widget> children = [];
    _favoriteNovels.forEach((data) {
      children.add(BookshelfItemView(data));
    });
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Wrap(
        spacing: 15,
        runSpacing: 20,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          RefreshIndicator(
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(top: 0),
              children: <Widget>[
                _favoriteNovels.length > 0 ? BookshelfHeader(_favoriteNovels[0]) : Container(),
                buildFavoriteView(),
              ],
            ),
            onRefresh: _loadData,
          ),
          buildNavigationBar(),
        ],
      ),
    );
  }
}