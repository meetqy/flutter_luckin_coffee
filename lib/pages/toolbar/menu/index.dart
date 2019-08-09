/*
 * @Author: meetqy
 * @since: 2019-08-06 11:56:11
 * @lastTime: 2019-08-09 17:40:16
 * @LastEditors: meetqy
 */
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/commonUI.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';
import 'package:flutter_luckin_coffee/widgets/index.dart';

import 'testData.dart';
import 'widgets/GoodsListRow.dart';
import 'widgets/MenuListRow.dart';

class Menu extends StatefulWidget {
  /// Appbar配置
  final AppBar appbar = AppBar(
    title: Text(
      "选择咖啡和小食", 
      style: TextStyle(color: rgba(56, 56, 56, 1), fontSize: 18),
    ),
    elevation: 0.0, // 去除底部阴影
    backgroundColor: rgba(255, 255, 255, 1),
    bottom: PreferredSize(
      child: Container(
        decoration: BoxDecoration(
          border: ui.borderBottom()
        ),
      ),
      preferredSize: Size.fromHeight(1.0),
    ),
  );

  Menu({Key key}) : super(key: key);

  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ScrollController _controller;
  static double appbarHeight = 0; // appbar高度
  static double listViewHeight = 0; // 菜单ListView的高度
  static double goodsViewWidth = 0; // 右侧商品宽度
  static double swiperOpacity = 1; // swiper透明度
  static int currentActive = 0;

  @override
  void initState() {
    appbarHeight = widget.appbar.preferredSize.height - 1;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    new Future.delayed(Duration.zero,() {
      setState(() {
        goodsViewWidth = screenWidth(context) - 90;
        listViewHeight = screenHeight(context) - appbarHeight - 130;
      });
    });

    super.initState();
  }

  /// 监听滚动条
  void _scrollListener() {
    setSwiperOpacity();
  }

  /// 设置swiper根据滚动条显示
  /// TODO: swiper切换的时候下拉，会导致swiper切换不流畅，以及切换混乱
  void setSwiperOpacity() {
    var calcOpacity = ((_controller.position.pixels - 130) / 100).abs();

    setState(() {
      swiperOpacity = calcOpacity >= 1 ? 1 : calcOpacity;
    });
  }

  /// 创建菜单列表
  List<Widget> createMenuList(List arr) {
    List<Widget> rows = [];
    arr.asMap().forEach((index, val) {
      rows.add(MenuListRow(
        val["name"], 
        isActive: index == currentActive,
        id: index,
        onPress: (id) {
          setState(() {
            currentActive = id;
          });
        },
      ));
    }); 

    return rows;
  }

  /// 创建商品列表
  /// 
  List<Widget> createGoodsList(List arr) {
    List<Widget> rows = [];

    arr.asMap().forEach((index, val) {
      var goodsList = val["list"];
      goodsList.asMap().forEach((index, val) {
        var recomment = val["recomment"];
        rows.add(
         GoodsListRow(
            imgSrc: val["imgsrc"],
            title: val['name'],
            desc: val["desc"],
            recomment: "默认：${recomment['spec']['name']}/${recomment['sugar']['name']}/${recomment['temperature']['name']}",
            price: double.parse("${val["price"]}"),
          )
        );
      });
    });

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: listViewHeight
        ),

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // 左侧菜单列表
                Container(
                  width: 90,
                  color: rgba(248, 248, 248, 1),
                  child: ListView(children: createMenuList(menuList),),
                ),

                // 右侧商品列表
                Container(
                  width: goodsViewWidth,
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: ListView(children: createGoodsList(goodsList)),
                )
            ],),
          )
        ],),
      )
    );
  }
}



