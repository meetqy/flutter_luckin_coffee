import 'dart:math' as math;

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/components/a_dialog/a_dialog.dart';
import 'package:flutter_luckin_coffee/components/goods_detail/index.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goods_list/data.dart';
import 'package:flutter_luckin_coffee/jsonserialize/order/data.dart';
import 'package:flutter_luckin_coffee/jsonserialize/shopping_cart/data.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/shopping_cart/widgets/recommend_goods.dart';
import 'package:flutter_luckin_coffee/provider/order_model.dart';
import 'package:flutter_luckin_coffee/provider/shopping_cart_model.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:provider/provider.dart';

import 'widgets/shopping_cart_row.dart';

class ShoppingCart extends StatefulWidget {
  static _ShoppingCartState _shoppingCartState;

  getAppBar() => _shoppingCartState.createAppBar();

  ShoppingCart() {
    if (_shoppingCartState == null) {
      _shoppingCartState = _ShoppingCartState();
    }
  }

  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  AppBar createAppBar() {
    /// 配置appbar
    return customAppbar(title: '购物车');
  }

  GoodsList goodsList;

  /// 排序规则：priceUp 商品升序，priceDown 商品倒序，ordersUp 销量升序，ordersDown 销量降序，addedUp 发布时间升序，addedDown 发布时间倒序
  final orderBy = [
    'priceUp',
    'priceDown',
    'ordersUp',
    'ordersDown',
    'addedUp',
    'addDown'
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      getGoodsList(context);
    });
  }

  getGoodsList(BuildContext context) async {
    G.loading.show(context);
    var reg = math.Random();

    int index = reg.nextInt(5);

    try {
      var res = await G.req.shop
          .goodsList(orderBy: orderBy[index], page: 1, pageSize: 3);

      Map result = res.data;

      setState(() {
        goodsList = GoodsList.fromJson(result);
      });
    } catch (e) {
      print(e);
    }

    G.loading.hide(context);
  }

  /// 购物车为空
  Container shoppingCartNotData() {
    return Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Column(
          children: <Widget>[
            Image.asset(
              './lib/assets/images/shopping_cart_null.png',
              width: 125,
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 32),
              child: Text(
                '您的购物车有点寂寞',
                style: TextStyle(color: rgba(166, 166, 166, 1), fontSize: 12),
              ),
            ),
            AButton.normal(
                width: 100,
                height: 30,
                type: 'info',
                color: rgba(144, 192, 239, 1),
                borderColor: rgba(144, 192, 239, 1),
                plain: true,
                child: Text('去喝一杯'),
                onPressed: () => G.pushNamed('/menu'))
          ],
        ));
  }

  /// 购物车商品
  List<Widget> buildShoppingCartList(ShoppingCartModel _shoppingCartModel,
      Map<String, ShoppingCartData> shoppingCartData) {
    List<Widget> shoppingCartList = [];
    List _list = shoppingCartData.keys.toList();
    int _listLen = _list.length;

    _list.asMap().forEach((index, key) {
      ShoppingCartData value = shoppingCartData[key];

      shoppingCartList.add(ShoppingCartRow(
        data: value,
        border: index >= _listLen - 1 ? false : true,
        onCheckBoxChange: (bool val) {
          setState(() {
            value.checked = val;
            _shoppingCartModel.modify(key, data: value);
          });
        },
        onChange: (val) {
          if (val < 1) {
            ADialog.confirm(
              context,
              content: '确认不要了吗？',
              confirmButtonPress: () {
                setState(() {
                  _shoppingCartModel.remove(key);
                });
              },
            );
          } else {
            setState(() {
              value.number = val;
              _shoppingCartModel.modify(key, data: value);
            });
          }
        },
      ));
    });

    return shoppingCartList;
  }

  @override
  Widget build(BuildContext context) {
    ShoppingCartModel _shoppingCartModel =
        Provider.of<ShoppingCartModel>(context);
    OrderModel _orderModel = Provider.of<OrderModel>(context);
    Map<String, ShoppingCartData> shoppingCartData = _shoppingCartModel.data;
    num totalPrice = _shoppingCartModel.totalPrice;

    bool shoppingCartIsEmpty = shoppingCartData.isEmpty;

    return Container(
      color: hex('#f7f7f7'),
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: !shoppingCartIsEmpty
                              ? Image.asset(
                                  'lib/assets/images/order/order1.png',
                                  fit: BoxFit.cover,
                                )
                              : null),

                      // 购物车列表展示
                      Container(
                          color: hex('#fff'),
                          child: shoppingCartIsEmpty
                              ? null
                              : Column(
                                  children: buildShoppingCartList(
                                      _shoppingCartModel, shoppingCartData))),

                      Center(
                          child: shoppingCartIsEmpty
                              ? shoppingCartNotData()
                              : null),

                      guessLike(_shoppingCartModel),
                    ],
                  )),
            ),
          ),
          buttomBtnRow(shoppingCartIsEmpty, totalPrice,
              shoppingCartModel: _shoppingCartModel, orderModel: _orderModel)
        ],
      ),
    );
  }

  /// 猜你喜欢
  Container guessLike(ShoppingCartModel model) {
    return goodsList == null
        ? Container()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                // title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '猜你喜欢',
                      style: TextStyle(
                          color: rgba(56, 56, 56, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          icontupian19(color: rgba(148, 196, 236, 1), size: 14),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              '换一批',
                              style: TextStyle(
                                  color: rgba(144, 192, 239, 1), fontSize: 11),
                            ),
                          )
                        ],
                      ),
                      onTap: () => getGoodsList(context),
                    )
                  ],
                ),

                // 推荐商品
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: goodsList.data.map((GoodsListDatum item) {
                      return RecommendGoods(
                          data: item,
                          onPress: (int id) {
                            /// 弹出商品详情  /widgets/goods_detail
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return GoodsDetailDialog(
                                    id: id,
                                    model: model,
                                  );
                                });
                          });
                    }).toList(),
                  ),
                )
              ],
            ),
          );
  }

  /// 底部合计
  Container buttomBtnRow(
    bool shoppingCartIsEmpty,
    num totalPrice, {
    ShoppingCartModel shoppingCartModel,
    OrderModel orderModel,
  }) {
    return Container(
      child: shoppingCartIsEmpty
          ? null
          : Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: rgba(242, 242, 242, 1))),
                color: hex('#fff'),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // left
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '应付合计',
                            style: TextStyle(
                                color: rgba(56, 56, 56, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '¥$totalPrice',
                            style: TextStyle(
                                color: rgba(56, 56, 56, 1),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),

                  // right button
                  AButton.normal(
                      child: Text('去结算'),
                      color: hex('#fff'),
                      bgColor: rgba(144, 192, 239, 1),
                      width: 120,
                      height: 60,
                      borderRadius: BorderRadius.zero,
                      onPressed: () {
                        Map<String, ShoppingCartData> shoppingCartModelData =
                            shoppingCartModel.data;
                        // Map<String, OrderData> orderModel =

                        List<OrderData> requestData = [];

                        shoppingCartModelData.values
                            .forEach((ShoppingCartData val) {
                          if (val.checked) {
                            Map<String, dynamic> jsonData = {
                              "goodsId": val.id,
                              "number": val.number,
                              "propertyChildIds": val.spec,
                              "logisticsType": 0,
                              "days": [DateTime.now().toString().split(' ')[0]]
                            };

                            requestData.add(OrderData.fromJson(jsonData));
                          }
                        });

                        /// 没有选中商品
                        if (requestData.isEmpty) {
                          G.toast('没有要结算的商品');
                        } else {
                          orderModel.init(requestData);
                          G.pushNamed('/order_confirm');
                        }
                      })
                ],
              ),
            ),
    );
  }
}
