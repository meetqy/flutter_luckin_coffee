import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/abutton/index.dart';
import 'package:flutter_luckin_coffee/components/astepper/AStepper.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goods_detail/data.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:flutter_luckin_coffee/widgets/goods_detail/select_row.dart';

class GoodsDetailDialog {
  final GoodsDetailData data;
  final BuildContext context;

  GoodsDetailBasicInfo basicInfo;
  List<GoodsDetailProperty> properties;

  GoodsDetailDialog({
    this.data,
    this.context
  });

  init() {
    basicInfo = data.basicInfo;
    properties = data.properties;
    return _initDialog();
  }

  _initDialog() {
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

  _initContent() {
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
    print(properties);
    // properties.forEach((item) {
    //   SelectRow(),
    // });
    return Column(
      children: <Widget>[
        Container(child: 
          Column(children: <Widget>[
            SelectRow("糖度",),
            SelectRow("糖度",),
            SelectRow("糖度",),
            SelectRow("糖度",),
          ],),
        ),
      ],
    );
  }

  /// 商品描述
  Widget _initGoodsDesc() {
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
                child: Text('浓缩咖啡与牛奶批次融合，加入祥龙巧克力风味。（建议到店引用，脑油融化钱口味更佳）\n主要原菜鸟：浓缩开发，牛娜，巧克力酱，交大奶油（喊小草风味糖浆），\n图片仅供参考，请以实物为准。建议送达后尽快引用。',
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
              child: Text('￥27', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: rgba(56, 56, 56, 1)),
              ),
            ),
            
            AStepper()
        ],),
        Container(
          alignment: Alignment.centerLeft,
          child: 
            Text('标准美式 ¥21+ 无糖 ¥0+ 无奶 ¥0',
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
            onPressed: () => {}
          )
        ],
      ),
    );
  }

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

      // 关闭
      Positioned(
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
      ),

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
          Text(basicInfo.name, 
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: hex('#fff')),
          ),
          Text(basicInfo.characteristic, 
            style: TextStyle(fontSize: 14,color: hex('#fff')),
          )
        ],),
      )
    ],);
  }
}