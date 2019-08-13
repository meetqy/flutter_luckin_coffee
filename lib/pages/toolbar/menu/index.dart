/*
 * @Author: meetqy
 * @since: 2019-08-06 11:56:11
 * @lastTime: 2019-08-13 17:03:36
 * @LastEditors: meetqy
 */
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/commonUI.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/dialogPage.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';
import 'package:flutter_luckin_coffee/widgets/index.dart';

import 'testData.dart';
import 'widgets/ClassifyDesc.dart';
import 'widgets/GoodsListRow.dart';
import 'widgets/MenuListRow.dart';

/// TODO：待解决：有时候滚动不流畅
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
  ScrollController _outController;          // 外层ScrollController
  ScrollController _goodsController;        // 商品列表ScrollController
  static double appbarHeight = 0;           // appbar高度
  static double listViewHeight = 0;         // 菜单ListView的高度
  static double goodsViewWidth = 0;         // 右侧商品宽度
  static double swiperOpacity = 1;          // swiper透明度
  static int currentActive = 1;             // 当前选中的菜单
  static bool isInnerScroll = false; 
  static double outMaxScrollExtent = 0;

  @override
  void initState() {
    appbarHeight = widget.appbar.preferredSize.height - 1;
    _outController = ScrollController();
    _outController.addListener(_outScrollListener);
    _goodsController = ScrollController();
    _goodsController.addListener(_goodsScrollListener);

    new Future.delayed(Duration.zero,() {
      setState(() {
        goodsViewWidth = screenWidth(context) - 90;
        listViewHeight = screenHeight(context) - appbarHeight - 130;
      });
    });

    super.initState();
  }

  /// 监听外部滚动
  void _outScrollListener() {
    _setSwiperOpacity();
    if(outMaxScrollExtent == 0){
      outMaxScrollExtent =  _outController.position.maxScrollExtent;
    } 

    if(_outController.offset >= num.parse('$outMaxScrollExtent')) {
      setState(() {
        isInnerScroll = true;
      });
      _outController.jumpTo(outMaxScrollExtent);
    } 
  }

  /// 监听商品滚动
  void _goodsScrollListener() {
    // print({
    //   "offset": _goodsController.offset,
    //   "maxScrollExtent": _goodsController.position.maxScrollExtent,
    //   "outOfRange": _goodsController.position.outOfRange
    // });

    if(_goodsController.offset <= 0) {
      setState(() {
        isInnerScroll = false;
      });
      _goodsController.jumpTo(0);
    }
  }

  /// 设置swiper根据滚动条显示
  void _setSwiperOpacity() {
    var calcOpacity = ((_outController.position.pixels - 130) / 100).abs();

    setState(() {
      swiperOpacity = calcOpacity >= 1 ? 1 : calcOpacity;
    });
  }

  /// 创建菜单列表
  List<Widget> createMenuList(Map menu) {
    List<Widget> rows = [];
    menu.forEach((key, val) {
      rows.add(MenuListRow(
        val["name"], 
        isActive: val['id'] == currentActive,
        id: val['id'],
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
  List<Widget> createGoodsList(List arr) {
    List<Widget> rows = []; // 包括分类的列表

    arr.asMap().forEach((index, val) {
      var goodsList = val["list"];
      var classifyDesc = menuList['${val['id']}'];
      List<Widget> goodsGroup = [];
      
      /// 创建分类的简介  每一类商品的顶部有商品分类的标题和介绍
      goodsGroup.add(
        ClassifyDesc(
          classifyDesc['name'], 
          desc: classifyDesc['desc'] == null ? null : classifyDesc['desc'],
        )
      );

      goodsList.asMap().forEach((index, val) {
        var recomment = val["recomment"];
        goodsGroup.add(
          GoodsListRow(
            /// 点击添加按钮弹出dialog
            onAddPress: (BuildContext context){
              dialogPage.show(context);
            },
            imgSrc: val["imgsrc"],
            title: val['name'],
            desc: val["desc"],
            recomment: recomment == null ? null : "默认：${recomment['spec']['name']}/${recomment['sugar']['name']}/${recomment['temperature']['name']}",
            price: double.parse("${val["price"]}"),
            border: !(index >= goodsList.length - 1),
            activeDesc: val["active"],
          )
        );
      });
    
      rows.add(
        Column(children: goodsGroup,)
      );
    });

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _outController,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: listViewHeight
        ),

        child: Column(children: <Widget>[
          InkWell(
            child: Opacity(
              opacity: swiperOpacity,  
              child: CustomSwiper([
                'lib/assets/images/menu/swiper1.jpg',
                'lib/assets/images/menu/swiper2.png',
              ], height: 130),
            ),
            onTap: () {
              
            },
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
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    children: createMenuList(menuList),
                  ),
                ),

                // 右侧商品列表
                Container(
                  width: goodsViewWidth,
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: ListView(
                    controller: _goodsController,
                    physics: isInnerScroll ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
                    children: createGoodsList(goodsList),
                  ),
                )
            ],),
          )
        ],),
      )
    );
  }
}



