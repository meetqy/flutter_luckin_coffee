/*
 * @Author: meetqy
 * @since: 2019-08-06 11:56:11
 * @lastTime: 2019-08-09 09:44:20
 * @LastEditors: meetqy
 */
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';
import 'package:flutter_luckin_coffee/widgets/index.dart';

class Menu extends StatefulWidget {
  /// Appbar配置
  final AppBar appbar = AppBar(
    title: Text(
      "选择咖啡和小食", 
      style: TextStyle(color: rgba(56, 56, 56, 1), fontSize: 18),
    ),
    elevation: 0.0, // 去除底部阴影
    backgroundColor: rgba(255, 255, 255, 1),
  );

  Menu({Key key}) : super(key: key);

  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ScrollController _controller;
  static double appbarHeight; // appbar高度
  static double listViewHeight; // 菜单ListView的高度
  static double swiperOpacity = 1; // swiper透明度

  @override
  void initState() {
    appbarHeight = widget.appbar.preferredSize.height - 1;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    new Future.delayed(Duration.zero,() {
      setState(() {
        listViewHeight = screenHeight(context) - appbarHeight - 130;
      });
    });

    super.initState();
  }

  _scrollListener() {
    var calcOpacity = ((_controller.position.pixels - 130) / 100).abs();

    setState(() {
      swiperOpacity = calcOpacity >= 1 ? 1 : calcOpacity;
    });

    // 到底部
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print('bottom');
    }

    // 到顶部
    if (_controller.offset <= _controller.position.minScrollExtent &&
    !_controller.position.outOfRange) {
      print('top');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(children: <Widget>[
        Opacity(
          opacity: swiperOpacity,
          child: CustomSwiper([
            'lib/assets/images/menu/swiper1.jpg',
            'lib/assets/images/menu/swiper2.png',
          ], height: 130,),
        ),
        
        Container(
          height: listViewHeight,
          color: hex('#ff0000'),
        )
        
      ],)
    );
  }
}



