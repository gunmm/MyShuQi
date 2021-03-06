import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/model/home_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';
import 'home_banner.dart';
import 'home_menu.dart';
import 'home_section_style1.dart';
import 'home_section_style2.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
enum HomeListType {
  excellent,
  male,
  female,
  cartoon
}

class HomeListView extends StatefulWidget {
  final HomeListType type;
  HomeListView(this.type);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeListViewState();
  }
}

class HomeListViewState extends State<HomeListView> {
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  List<CarouselInfo> carouselInfos = [];
  List<HomeModule> modules = [];

  Future<Null> loadData() async{

    return Future.delayed(Duration(seconds: 2), () async {
      try {
        var action;
        switch(this.widget.type) {
          case HomeListType.excellent:
            action = "home_excellent";
            break;
          case HomeListType.male:
            action = "home_female";
            break;
          case HomeListType.female:
            action = "home_male";
            break;
          case HomeListType.cartoon:
            action = "home_cartoon";
            break;
        }
        var responseJson = await Request.get(action: action);
        List moduleData = responseJson["module"];
        List<HomeModule> modules = [];
        moduleData.forEach((data){
          modules.add(HomeModule.fromJson(data));
        });

        setState(() {
          this.modules = modules;
        });

      } catch(e) {
        Fluttertoast.showToast(msg:e.toString());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }


  Widget buildModule(HomeModule module) {
    if(module.carousels != null) {
      return HomeBanner(module.carousels);
    } else if(module.menus != null) {
      return HomeMenu(module.menus);
    } else if(module.books != null) {
      switch (module.style) {
        case 1:
          return HomeSectionStyle1(module);
          break;
        case 2:
          return HomeSectionStyle2(module);
          break;
        case 3:
          return HomeSectionStyle2(module);
          break;
        case 4:
          return HomeSectionStyle2(module);
          break;
      }
    }

    return new Container();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child:
      EasyRefresh(
        onRefresh: loadData,
        refreshHeader: ClassicsHeader(
          key: _headerKey,
          refreshText: "pullToRefresh",
          refreshReadyText: "releaseToRefresh",
          refreshingText: "refreshing" + "...",
          refreshedText: "refreshed",
          moreInfo: (DateTime.now()).toString().substring(0, 19),
          bgColor: Colors.transparent,
          textColor: Colors.black87,
          moreInfoColor: Colors.black54,
          showMore: true,
        ),
        refreshFooter: ClassicsFooter(
          key: _footerKey,
          loadText: "pushToLoad",
          loadReadyText: "releaseToLoad",
          loadingText: "loading",
          loadedText: "loaded",
          noMoreText: "loaded",
          moreInfo: (DateTime.now()).toString().substring(0, 19),
          bgColor: Colors.transparent,
          textColor: Colors.black87,
          moreInfoColor: Colors.black54,
          showMore: true,
        ),
        footerStatusChanged: (FooterStatus){
          print(FooterStatus);
//          if (FooterStatus == RefreshFooterStatus.LOADED) {
//
//          }
//
//
//            _footerKey.currentState.refreshFooterStatus = RefreshFooterStatus.LOADED;

        },
        loadMore: loadData,
        child: ListView.builder(
          itemCount: this.modules.length,
          itemBuilder: (BuildContext context, int index) {
            return buildModule(this.modules[index]);
          },
        ),
      ),
    );
  }
}