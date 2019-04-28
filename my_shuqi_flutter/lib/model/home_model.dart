import 'novel.dart';

class HomeModule {
  String id;
  String name;
  int style;
  List content;

  List<CarouselInfo> carousels;
  List<MenuInfo> menus;
  List<Novel> books;

  HomeModule.fromJson(Map map) {
    id = map["id"];
    name = map["m_s_name"];
    content = map["content"];
    if (name == "顶部banner") {
      carousels = [];
      content.forEach((data) {
        carousels.add(CarouselInfo.fromJson(data));
      });
    }

    if (name == '顶部导航') {
      menus = [];
      content.forEach((data) {
        menus.add(MenuInfo.fromJson(data));
      });
    }

    if (map['m_s_style'] != null) {
      style = map['m_s_style'];
      books = [];
      content.forEach((data) {
        books.add(Novel.fromJson(data));
      });
    }

  }
}

class MenuInfo {
  String title;
  String icon;
  MenuInfo.fromJson(Map map) {
    title = map["toTitle"];
    icon = map["icon"];
  }
}

class CarouselInfo {
  String imageUrl;
  String link;
  CarouselInfo.fromJson(Map map) {
    imageUrl = map["image_url"];
    link = map["link_url"];

  }
}