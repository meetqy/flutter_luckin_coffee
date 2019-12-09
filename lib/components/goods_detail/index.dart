import 'dart:convert';

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/components/a_stepper/a_stepper.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goods_detail/data.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goods_price/data.dart';
import 'package:flutter_luckin_coffee/jsonserialize/shopping_cart/data.dart';
import 'package:flutter_luckin_coffee/provider/shopping_cart_model.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

import 'select_row.dart';

class GoodsDetailDialog extends StatefulWidget {
  final int id;
  final ShoppingCartModel model;

  GoodsDetailDialog({
    Key key,
    this.id,
    this.model
  }) : super(key: key);

  _GoodsDetailDialogState createState() => _GoodsDetailDialogState();
}

class _GoodsDetailDialogState extends State<GoodsDetailDialog> {
  /// 当前选中规格信息
  Map defaultValue = {
    "spec": {
      // typeId: childId,
      // typeId: childId,
    },
    "specName": "",
    "price": 0,
    "num": 1,
  };

  ShoppingCartModel _shoppingCartModel;

  GoodsDetailData data;

  @override
  void initState() {
    super.initState();

    _shoppingCartModel = widget.model;
    Future.delayed(Duration.zero, () async{
      var res = await G.req.shop.goodsDetail(id: widget.id);

      Map result = res.data;

      GoodsDetailData goodsDetailData = GoodsDetailData.fromJson(result['data']);

      // 格式化默认规格
      Map<String, int> spec = {};
      String defaultSpec = goodsDetailData.extJson?.defaultSpec;
      if(goodsDetailData.extJson.defaultSpec == null) {
        goodsDetailData.properties.forEach((val) {
          spec['${val.id}'] = val.childsCurGoods[0].id;
        }); 
      } else {
        Map<String, dynamic> specDecode = json.decode(defaultSpec.replaceAll('\'', "\""));
        
        specDecode.forEach((key, value) {
          spec['$key'] = int.parse(value.toString());
        });
      }

      // 获取当前规格的价格
      Map resultPrice = await _getGoodsPrice(spec, data: goodsDetailData);

      if(resultPrice['status']) {
        GoodsPrice goodsPrice = GoodsPrice.fromJson(resultPrice['data']);
        GoodsPriceData goodsPriceData = goodsPrice.data;

        setState(() {
          data = goodsDetailData;
          defaultValue['spec'] = spec;
          defaultValue['price'] = goodsPriceData.price;
          defaultValue['specName'] = goodsPriceData.propertyChildNames;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.zero,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 280.0),
            child: Material(
              color: Colors.transparent,
              elevation: 24.0,
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
              type: MaterialType.card,
              child: _initContent(),
            ),
          ),
        ),
      ),
    );
  }

    /// 获取当前规定价格
  Future<Map> _getGoodsPrice(Map<String, int> spec, {
    @required GoodsDetailData data
  }) async {
    Map<String, dynamic> resultJson = {};

    /// status为false没有获取到规格 || 规格没有任何修改不发起请求
    if(defaultValue['spec'].toString() == spec.toString()) return {
      "status": false,
      "data": null
    };

    G.loading.show(context);

    String propertyChildIds = spec.toString().replaceAll(RegExp('\\s|{|}'), '');
    // print(propertyChildIds);
    try {
      var res = await G.req.shop.goodsPrice(
        goodsId: data.basicInfo.id,
        propertyChildIds: propertyChildIds,
      );

      Map result = await res.data;
      
      resultJson['status'] = true;
      resultJson['data'] = result;
    } catch(e) {
      resultJson['status'] = false;
      resultJson['data'] = e;
    }

    G.loading.hide(context);
    return resultJson;
  }
  
  _initContent() {
    if(data == null) {
      return Container(
        width: 335,
        height: 580,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: hex('#fff'),
        ),
        child: Stack(
          children: <Widget>[
            _initClose()
          ],
        )
      );
    }
    return Container(
      width: 335,
      height: 580,
      child: Column(
        children: <Widget>[
          _initHeader(),
          Expanded(
            child: Container(
              color: hex('#fff'),
              padding: EdgeInsets.symmetric(vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _initOption(),
                    _line(),
                    _initGoodsDesc()
                  ],
                )
              ),
            ),
          ),
        
          _initAccount(),
          _initFooter()
        ],
      ),
    );
  }

  /// 分隔线
  _line() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          border: G.borderBottom()
        ),
      ),
    );
  }

  /// 选项
  _initOption() {
    List<Widget> widgets = [];
    data.properties.forEach((GoodsDetailProperty item) {
      widgets.add(
        SelectRow(
          id: defaultValue['spec']['${item.id}'],
          data: item,
          onChange: (Map type) async{
            Map<String, int> spec = Map.from(defaultValue['spec']);

            spec['${type['typeId']}'] = type['childId'];

            Map result = await _getGoodsPrice(spec, data: data);
            if(result['status']) {
              GoodsPrice goodsPrice = GoodsPrice.fromJson(result['data']);
              GoodsPriceData goodsPriceData = goodsPrice.data;

              setState(() {
                defaultValue['spec'] = spec;
                defaultValue['price'] = goodsPriceData.price;
                defaultValue['specName'] = goodsPriceData.propertyChildNames;
              });
            }
          },
        )
      );
    });
    return Column(
      children: <Widget>[
        Container(child: 
          Column(children: widgets,),
        ),
      ],
    );
  }

  /// 商品描述
  Widget _initGoodsDesc() {
    String desc = data.content.replaceAll(RegExp("<.*?p>"), "").replaceAll(RegExp('\\\\n'), '\n');

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(child: 
              Text('商品描述',style: TextStyle(color: rgba(56, 56, 56, 1),fontSize: 13),),
            )
          ],),
          
          Row(children: <Widget>[
            Expanded(child: 
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(desc,
                  style: TextStyle(
                    fontSize: 12,
                    color: rgba(128, 128, 128, 1)
                  ),
                )
              )
            ,)
          ],)
      ],),
    );
  }

  /// 结算总价
  Widget _initAccount() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: rgba(242, 242, 242, 1), width: 1),
          bottom:  BorderSide(color: rgba(242, 242, 242, 1), width: 1),
        ),
        color: hex('#fff'),
      ),
      height: 60,
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text('￥${defaultValue["price"]*defaultValue["num"]}', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: rgba(56, 56, 56, 1)),
              ),
            ),
            
            AStepper(
              value: defaultValue['num'],
              min: 1,
              onChange: (num val) {
                setState(() {
                  defaultValue['num'] = val;
                });
              },
            )
        ],),
        Container(
          alignment: Alignment.centerLeft,
          child: 
            Text('${data.basicInfo.name} ${G.handleGoodsDesc(defaultValue['specName'])}',
            style: TextStyle(
              color: rgba(80, 80, 80, 1),
              fontSize: 10
            ),
          )
        )
      ],),
    ); 
  }

  /// 底部
  Widget _initFooter() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        color: hex('#fff'),
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AButton.icon(
            icon: icontupian17(size: 14,),
            textChild: Text('充2赠1', style: TextStyle(fontSize: 12),),
            color: hex('#fff'),
            bgColor: rgba(255, 129, 2, 1),
            height: 32,
            onPressed: () => {}
          ),
          AButton.icon(
            height: 32,
            icon: iconsc(size: 14,),
            textChild: Text('收藏口味', style: TextStyle(fontSize: 12),),
            color: rgba(136, 175, 213, 1),
            bgColor: rgba(136, 175, 213, 0.3),
            onPressed: () => {}
          ),
          AButton.icon(
            height: 32,
            icon: icongouwuche(size: 14,),
            bgColor: rgba(136, 175, 213, 1),
            color: hex('#fff'),
            textChild: Text('加入购物车', style: TextStyle(fontSize: 12),),
            onPressed: () async {
              G.loading.show(context);
              
              await G.sleep();

              if(mounted) {
                Map<String, dynamic> mockdata = {
                  "id": data.basicInfo.id,
                  "name": data.basicInfo.name,
                  "price": defaultValue['price'],
                  "number": defaultValue['num'],
                  "spec": defaultValue['spec'],
                  "specName": defaultValue['specName'],
                };
                ShoppingCartData shoppingCartData = ShoppingCartData.fromJson(mockdata);

                _shoppingCartModel.add(shoppingCartData);
              }
              
              G.loading.hide(context);
              G.pop();

              G.toast('加入购物车成功');
            }
          )
        ],
      ),
    );
  }

  /// 收藏
  Widget _circelIcon({Icon icon, Function onPress, Color bgColor}) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor == null ? rgba(0, 0, 0, 0.3) : bgColor,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: icon
      ),
      onTap: () {
        if(onPress!=null) {
          onPress();
        }
      },
    );
  }

  /// 关闭弹窗
  Widget _initClose() {
    // 关闭
    return Positioned(
      right: 10,
      top: 10,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: rgba(0, 0, 0, 0.3),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: iconhebingxingzhuang(color: hex('#fff'), size: 16),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      )
    );
  }

  /// 头部
  Widget _initHeader() {
    return Stack(children: <Widget>[
      Container(
        width: 335,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          child: Image.asset('lib/assets/images/menu/dialog1.jpg', height: 150, fit: BoxFit.cover,),
        ),
      ),

      _initClose(),

      // 收藏
      Positioned(
        left: 10,
        top: 10,
        child: _circelIcon(
          icon: iconsc(color: hex('#fff'), size: 16),
        )
      ),

      // 标题
      Positioned(
        left: 15,
        bottom: 15,
        child: Column(children: <Widget>[
          Text(data.basicInfo.name, 
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: hex('#fff')),
          ),
          Text(data.basicInfo.characteristic, 
            style: TextStyle(fontSize: 14,color: hex('#fff')),
          )
        ],),
      )
    ],);
  }
}

  