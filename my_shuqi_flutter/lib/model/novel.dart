

class Novel {
  String id;
  String name;
  String imgUrl;
  String authorName;
  String recommendNum;


  Novel.fromJson(Map data) {
    id = data['bid'];
    name = data['bookname'];
    imgUrl = data['book_cover'];
    authorName = data['author_name'];

    int recommendIntNum = int.parse(data['recommend_num']);
    if (recommendIntNum > 10000) {
      recommendNum = "${(recommendIntNum/10000).toStringAsFixed(2)}万人";
    } else {
      recommendNum = "$recommendIntNum人";
    }

  }
}