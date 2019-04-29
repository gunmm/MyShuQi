import 'package:flutter/material.dart';

class HomeSectionHeader extends StatelessWidget {
  final String title;
  HomeSectionHeader(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Image.asset("images/home_tip.png"),
          SizedBox(width: 7),
          Text(this.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}