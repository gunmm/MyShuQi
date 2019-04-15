

class Novel {
  String id;
  String name;
  String imgUrl;


  Novel.fromJson(Map data) {
    id = data['bid'];
    name = data['bookname'];
    imgUrl = data['book_cover'];
  }
}