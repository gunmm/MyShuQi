import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_shuqi_flutter/bookshelf/bookshelf_scene.dart';
import 'package:my_shuqi_flutter/home/home_scene.dart';
import 'package:my_shuqi_flutter/my/my_scene.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';

class RootScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootSceneState();
}

class RootSceneState extends State<RootScene> {
  int _tabIndex = 1;
  List<Image> _tabImages = [
    Image.asset('images/tab_bookshelf_n.png'),
    Image.asset('images/tab_bookstore_n.png'),
    Image.asset('images/tab_me_n.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('images/tab_bookshelf_p.png'),
    Image.asset('images/tab_bookstore_p.png'),
    Image.asset('images/tab_me_p.png'),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //等待添加事件们
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          BookshelfScene(),
          HomeScene(),
          MyScene(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: SQColor.primary,
        items: [
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text("书架"), ),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text("书城")),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text("我的")),
        ],
        iconSize: 50,
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }


  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}