/*
 * @Author: meetqy
 * @since: 2019-08-06 11:56:11
 * @lastTime: 2019-09-12 15:26:08
 * @LastEditors: meetqy
 */
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';
import 'package:flutter_luckin_coffee/widgets/CustomSwiper/index.dart';
import 'package:flutter_luckin_coffee/widgets/DialogPage/index.dart';

import 'testData.dart';
import 'widgets/ClassifyDesc.dart';
import 'widgets/GoodsListRow.dart';
import 'widgets/MenuListRow.dart';

/// TODO: 待解决：点击左侧菜单，右侧商品列表跳转
class Menu extends StatefulWidget {
  static _MenuState _menuState;

  getAppBar() => _menuState.createAppBar();

  Menu(){
    _menuState = _MenuState();
  }

  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  static int currentActive = 1;             // 当前选中的菜单
  static double _nestedScrollOffet = 0;

  final ScrollController _nestedScrollController = new ScrollController();

  AppBar createAppBar() {
    return null;
  }

  @override
  void initState() {
    _nestedScrollController.addListener(() {
      setState(() {
        _nestedScrollOffet = _nestedScrollController.offset;
      });
    });

    super.initState();
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
    return SafeArea(
      child: NestedScrollView(
        controller: _nestedScrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget> [
            SliverAppBar(
              expandedHeight: 186,
              pinned: true,
              floating: false,
              elevation: 0,
              bottom: PreferredSize(
                child: Container(
                  decoration: BoxDecoration(
                    border: ui.borderBottom()
                  ),
                ),
                preferredSize: Size.fromHeight(0),
              ),
              title: Text('选择咖啡和小食', style: TextStyle(
                color: rgba(56, 56, 56, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  margin: EdgeInsets.only(top: 56),
                  child: InkWell(
                    child: Opacity(
                      opacity: 1,  
                      child: CustomSwiper([
                          'lib/assets/images/menu/swiper1.jpg',
                          'lib/assets/images/menu/swiper2.png',
                        ], height: 130),
                    ),
                    onTap: () {
                      
                    },
                  ),
                ),
              )
            )
          ];
        },
        body: Container(
          padding: EdgeInsets.only(top: _nestedScrollOffet >= 130 ? (_nestedScrollOffet - 130) : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // 左侧菜单列表
              Container(
                width: 90,
                color: rgba(248, 248, 248, 1),
                child: Column(children: createMenuList(menuList),),
              ),

              // 右侧商品列表
              Container(
                width: screenWidth(context) - 90,
                padding: EdgeInsets.symmetric(horizontal: 14),
                // 使用listview中的scrollcontronal导致外层的NestedScrollView效果失效，
                // 使用NotificationListener完美解决
                child: NotificationListener(
                  child: ListView(
                    physics: _nestedScrollOffet >= 130 ? BouncingScrollPhysics() : ClampingScrollPhysics(),
                    children: createGoodsList(goodsList),
                  ),
                  onNotification: (ScrollNotification scrollInfo) {
                    // print(scrollInfo);
                    return null;
                  },
                ),
              )
          ],),
        ),
      ),
    );
  }
}