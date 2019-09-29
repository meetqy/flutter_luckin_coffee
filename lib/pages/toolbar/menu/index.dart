/*
 * @Author: meetqy
 * @since: 2019-08-06 11:56:11
 * @lastTime: 2019-09-29 17:44:37
 * @LastEditors: meetqy
 */

import 'dart:math';

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goodscategory/data.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goodslist/data.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:flutter_luckin_coffee/widgets/CustomSwiper/index.dart';
import 'package:flutter_luckin_coffee/widgets/DialogPage/index.dart';

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
  static int nowCategoryId;             // 当前选中的菜单
  static double _nestedScrollOffet = 0;

  final ScrollController _nestedScrollController = new ScrollController();

  Map<String, dynamic> categoryCombineGoods = {};
  
  final List actives = ['满50减20', '充2赠1', '买2送1'];

  /// 把商品列表，和分类的部分设置为变量。
  /// 解决：滚动页面，重复渲染
  List<Widget> goodsListWidgets = []; 
  List<Widget> categoryWidgets = [];

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

     _init();

    super.initState();
  }

  _init() async {
    Iterable<Future> requestList = [
      G.dio.get('/shop/goods/list'), 
      G.dio.get('/shop/goods/category/all')
    ];

    List result =  await Future.wait(requestList);

    GoodsList goodsList = GoodsList.fromJson(result[0]);
    int goodsListLen = goodsList.data.length;
    GoodsCategory goodsCategory = GoodsCategory.fromJson(result[1]);

    List<Widget> goodsListWidgetsTemp = [];
    List<Widget> categoryWidgetsTemp = [];
    Random rand = Random(); // 随机数

    goodsCategory.data.forEach((GoodsCategoryDatum category) {
      // 商品列表 每类商品 标题  eg: 人气top
      goodsListWidgetsTemp.add(
        ClassifyDesc(
          category.name,
          desc: null
        )
      );

      // 分类
      categoryWidgetsTemp.add(MenuListRow(
        category.name, 
        isActive: category.id == nowCategoryId,
        id: category.id,
        onPress: (id) {
          setState(() {
            nowCategoryId = id;
          });
        },
      ));


      goodsList.data.asMap().forEach((int index, GoodsListDatum goods) {
        if(category.id == goods.categoryId) {
          // 商品列表 商品
          goodsListWidgetsTemp.add(
            GoodsListRow(
              // 点击添加按钮弹出dialog
              onAddPress: (BuildContext context){
                dialogPage.show(context);
              },
              imgSrc: goods.pic,
              title: goods.name,
              desc: goods.characteristic,
              recomment: "",
              price: goods.originalPrice,
              border: !(index >= goodsListLen - 1),
              activeDesc: actives[rand.nextInt(3)],
            )
          );
        }
      });
    });

    setState(() {
      goodsListWidgets = goodsListWidgetsTemp;
      categoryWidgets = categoryWidgetsTemp;
      nowCategoryId = goodsCategory.data[0].id;
    });
    
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
                    border: G.borderBottom()
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
                child: Column(children: categoryWidgets,),
              ),

              // 右侧商品列表
              Container(
                width: G.screenWidth() - 90,
                padding: EdgeInsets.symmetric(horizontal: 14),
                // 使用listview中的scrollcontronal导致外层的NestedScrollView效果失效，
                // 使用NotificationListener完美解决
                child: NotificationListener(
                  child: ListView(
                    physics: _nestedScrollOffet >= 130 ? BouncingScrollPhysics() : ClampingScrollPhysics(),
                    children: goodsListWidgets,
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