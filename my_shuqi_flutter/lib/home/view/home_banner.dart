import 'package:flutter/material.dart';
import 'package:my_shuqi_flutter/model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_shuqi_flutter/utils/public_head.dart';

class HomeBanner extends StatelessWidget {
  final List<CarouselInfo> carouselInfos;
  HomeBanner(this.carouselInfos);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: CarouselSlider(
          items: this.carouselInfos.map((info){
            return Container(
              width: Screen.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.network(
                info.imageUrl ?? "",
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        autoPlay: true,
        aspectRatio: 2,
      ),
    );
  }
}