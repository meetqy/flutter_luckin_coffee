import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/custom_swiper/index.dart';
import 'package:flutter_luckin_coffee/components/goods_detail/index.dart';
import 'package:flutter_luckin_coffee/mock/goods_category.dart';
import 'package:flutter_luckin_coffee/mock/goods_list.dart';
import 'package:get/get.dart';

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
  List<MockGoodsCategory> category = MockGoodsCategory.data();

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

    Future.delayed(Duration.zero, () async {
      _init(context);
    });

    super.initState();
  }

  _init(BuildContext context) async {
    // G.loading.show(context);

    List<MockGoods> goods = MockGoods.data();

    List<Widget> goodsListWidgetsTemp = [];
    Random rand = Random(); // 随机数

    category.forEach((item) {
      var categoryId = category.indexOf(item);
      // 商品列表 每类商品 标题  eg: 人气top
      goodsListWidgetsTemp.add(ClassifyDesc(item.name, desc: item.desc));

      goods.forEach((goodsItem) {
        var goodsId = goods.indexOf(goodsItem);
        if (categoryId == goodsItem.categoryId) {
          // 商品列表 商品
          goodsListWidgetsTemp.add(
            GoodsListRow(
              // 点击添加按钮弹出dialog
              onPress: (BuildContext context) {
                /// 弹出商品详情  /widgets/goods_detail
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return GoodsDetailDialog(
                      id: goodsId,
                    );
                  },
                );
              },
              data: goodsItem,
              border: !(goodsId >= goods.length - 1),
              activeDesc: actives[rand.nextInt(3)],
            ),
          );
        }
      });
    });

    setState(() {
      nowCategoryId = 0;
      goodsListWidgets = goodsListWidgetsTemp;
      category = MockGoodsCategory.data();
    });

    // G.loading.hide(context);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _nestedScrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 186,
            pinned: true,
            floating: false,
            elevation: 0,
            title: Text(
              '选择咖啡和小食',
              style: TextStyle(
                  color: Color.fromRGBO(56, 56, 56, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Container(
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
              ),
            ),
          )
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
              color: Color.fromRGBO(248, 248, 248, 1),
              child: Column(
                children: category.map((item) {
                  var index = category.indexOf(item);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        nowCategoryId = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 44,
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: nowCategoryId == index
                                  ? Color.fromRGBO(242, 242, 242, 1)
                                  : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          color: Color(0xffffff)
                              .withOpacity(nowCategoryId == index ? 1.0 : 0.0)),
                      child: Text(item.name),
                    ),
                  );
                }).toList(),
              ),
            ),

            // 右侧商品列表
            Container(
              width: Get.width - 90,
              padding: EdgeInsets.symmetric(horizontal: 14),
              // 使用listview中的scrollcontronal导致外层的NestedScrollView效果失效，
              // 使用NotificationListener完美解决
              child: NotificationListener(
                child: ListView(
                  // 取消listView回弹
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
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
    );
  }
}
