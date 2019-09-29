/*
 * @Author: meetqy
 * @since: 2019-08-06 11:56:11
 * @lastTime: 2019-09-29 16:30:36
 * @LastEditors: meetqy
 */

import 'dart:math';

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goodscategory/data.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goodslist/data.dart';
import 'package:flutter_luckin_coffee/utils/Request.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
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
  static int nowCategoryId;             // 当前选中的菜单
  static double _nestedScrollOffet = 0;

  final ScrollController _nestedScrollController = new ScrollController();

  Map<String, dynamic> categoryCombineGoods = {};
  
  final List actives = ['满50减20', '充2赠1', '买2送1'];

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

  /// 获取商品列表
  _init() async {
    Iterable<Future> requestList = [
      Request.get('/shop/goods/list'), 
      Request.get('/shop/goods/category/all')
    ];

    List result =  await Future.wait(requestList);

    GoodsList goodsList = GoodsList.fromJson(result[0]) ;
    GoodsCategory goodsCategory = GoodsCategory.fromJson(result[1]);

    
    Map<String, dynamic> categoryCombineGoodsTemp = {
      /// category.id: {
      ///   category: GoodsCategoryDatum
      ///   goodsList: [GoodsListDatum]
      /// }
    };

    goodsCategory.data.forEach((GoodsCategoryDatum category) {
      List<GoodsListDatum> nowGoodsList = [];
      goodsList.data.forEach((GoodsListDatum goods) {
        if(category.id == goods.categoryId) {
          nowGoodsList.add(goods);
        }
      });

      categoryCombineGoodsTemp['${category.id}'] = {
        "category": category,
        "goodsList": nowGoodsList
      };
    });

    setState(() {
      categoryCombineGoods = categoryCombineGoodsTemp;
      nowCategoryId = goodsCategory.data[0].id;
    });
  }

  /// 创建菜单列表
  List<Widget> createMenuList() {
    List<Widget> rows = [];

    categoryCombineGoods.forEach((key, val) {
      GoodsCategoryDatum category = val['category'];
      rows.add(MenuListRow(
        category.name, 
        isActive: category.id == nowCategoryId,
        id: category.id,
        onPress: (id) {
          setState(() {
            nowCategoryId = id;
          });
        },
      ));
    });

    return rows;
  }

  /// 创建商品列表
  List<Widget> createGoodsList(List arr) {
    List<Widget> rows = []; // 包括分类的列表

    Random rand = Random();

    categoryCombineGoods.forEach((key, val) {
      GoodsCategoryDatum category = val['category'];
      List<GoodsListDatum> goodsList = val['goodsList'];
      int goodsListLen = goodsList.length;
      List<Widget> goodsGroup = [];
      /// 创建分类的简介  每一类商品的顶部有商品分类的标题和介绍

      goodsGroup.add(
        ClassifyDesc(
          category.name,
          desc: null
        )
      );

      goodsList.asMap().forEach((int index, GoodsListDatum goods) {
        
        goodsGroup.add(
          GoodsListRow(
            /// 点击添加按钮弹出dialog
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
                child: Column(children: createMenuList(),),
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