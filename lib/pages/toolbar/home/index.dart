/*
 * @Author: meetqy
 * @since: 2019-08-06 11:54:12
 * @lastTime: 2019-08-07 15:03:30
 * @LastEditors: meetqy
 */

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'HomeIcon.dart';

class Home extends StatefulWidget {
  /// Appbar配置
  final AppBar appbar = null; 

  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Stack(children: <Widget>[
          // 轮播图
          Positioned(child: 
            Container(
              height: 288,
              child: new Swiper(
                itemBuilder: (BuildContext context,int index){
                  return Image.asset('lib/assets/images/home/swiper${index+1}.jpg', fit: BoxFit.cover);
                },
                itemCount: 3,
                pagination: SwiperPagination(
                  builder:  DotSwiperPaginationBuilder(
                    size: 8,
                    activeSize: 8
                  )
                ),
                autoplay: true,
                duration: 500,
                autoplayDelay: 5000
              ),
            ),
          ),

          // 扫描二维码
          Positioned(
            top: 50,
            right: 10,
            child: HomeIcon(
              icontupian4(size: 20, color: hex('#fff')),
              bgColor: rgba(0, 0, 0, .3),
              border: false,
            )
          ,)
        ],)
        
      ],),
    );
  }
}

