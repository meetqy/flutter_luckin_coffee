/*
 * @Author: meetqy
 * @since: 2019-08-06 11:56:11
 * @lastTime: 2019-11-23 11:39:49
 * @LastEditors: meetqy
 */

import 'dart:math';

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/custom_swiper/index.dart';
import 'package:flutter_luckin_coffee/components/goods_detail/index.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goods_category/data.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goods_list/data.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/category.dart';
import 'package:flutter_luckin_coffee/provider/shopping_cart_model.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:provider/provider.dart';

import 'goods_list_row.dart';
import 'widgets/classify_desc.dart';

/// TODO: 待解决：点击左侧菜单，右侧商品列表跳转
class Menu extends StatefulWidget {
  static _MenuState _menuState;

  getAppBar() => _menuState.createAppBar();

  Menu() {
    _menuState = _MenuState();
  }

  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  static int nowCategoryId; // 当前选中的菜单
  static double _nestedScrollOffet = 0;

  final ScrollController _nestedScrollController = new ScrollController();

  Map<String, dynamic> categoryCombineGoods = {};

  final List actives = ['满50减20', '充2赠1', '买2送1'];

  /// 把商品列表，和分类的部分设置为变量。
  /// 解决：滚动页面，重复渲染
  List<Widget> goodsListWidgets = [];
  List<GoodsCategoryDatum> category = [];

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

    Future.delayed(Duration.zero, () {
      _init(context);
    });

    super.initState();
  }

  _init(BuildContext context) async {
    G.loading.show(context);
    try {
      Iterable<Future> requestList = [
        G.req.shop.goodsList(),
        G.req.shop.goodsCategoryAll(),
      ];

      List result = await Future.wait(requestList);

      GoodsList goodsList = GoodsList.fromJson(result[0].data);
      int goodsListLen = goodsList.data.length;
      GoodsCategory goodsCategory = GoodsCategory.fromJson(result[1].data);

      List<Widget> goodsListWidgetsTemp = [];
      Random rand = Random(); // 随机数

      goodsCategory.data.forEach((GoodsCategoryDatum category) {
        // 商品列表 每类商品 标题  eg: 人气top
        goodsListWidgetsTemp.add(ClassifyDesc(category.name, desc: null));

        goodsList.data.asMap().forEach((int index, GoodsListDatum goods) {
          if (category.id == goods.categoryId) {
            // 商品列表 商品
            goodsListWidgetsTemp.add(GoodsListRow(
              // 点击添加按钮弹出dialog
              onPress: (BuildContext context, int id) {
                /// 弹出商品详情  /widgets/goods_detail
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      final ShoppingCartModel _shoppingCartModel =
                          Provider.of<ShoppingCartModel>(context);
                      return GoodsDetailDialog(
                        id: id,
                        model: _shoppingCartModel,
                      );
                    });
              },
              data: goods,
              border: !(index >= goodsListLen - 1),
              activeDesc: actives[rand.nextInt(3)],
            ));
          }
        });
      });

      setState(() {
        nowCategoryId = goodsCategory.data[0].id;
        goodsListWidgets = goodsListWidgetsTemp;
        category = goodsCategory.data;
      });

      G.loading.hide(context);
    } catch (e) {
      print(e);
      G.loading.hide(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        controller: _nestedScrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 186,
                pinned: true,
                floating: false,
                elevation: 0,
                bottom: PreferredSize(
                  child: Container(
                    decoration: BoxDecoration(border: G.borderBottom()),
                  ),
                  preferredSize: Size.fromHeight(0),
                ),
                title: Text(
                  '选择咖啡和小食',
                  style: TextStyle(
                      color: rgba(56, 56, 56, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
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
                      onTap: () {},
                    ),
                  ),
                ))
          ];
        },
        body: Container(
          padding: EdgeInsets.only(
              top: _nestedScrollOffet >= 130 ? (_nestedScrollOffet - 130) : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // 左侧菜单列表
              Container(
                width: 90,
                color: rgba(248, 248, 248, 1),
                child: Category(
                  data: category,
                  id: nowCategoryId,
                  getCayegoryId: (id) {
                    if (nowCategoryId != id) {
                      setState(() {
                        nowCategoryId = id;
                      });
                    }
                  },
                ),
              ),

              // 右侧商品列表
              Container(
                width: G.screenWidth() - 90,
                padding: EdgeInsets.symmetric(horizontal: 14),
                // 使用listview中的scrollcontronal导致外层的NestedScrollView效果失效，
                // 使用NotificationListener完美解决
                child: NotificationListener(
                  child: ListView(
                    physics: _nestedScrollOffet >= 130
                        ? BouncingScrollPhysics()
                        : ClampingScrollPhysics(),
                    children: goodsListWidgets,
                  ),
                  onNotification: (ScrollNotification scrollInfo) {
                    // print(scrollInfo);
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
