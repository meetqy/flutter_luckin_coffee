import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/components/a_stepper/a_stepper.dart';

import 'select_row.dart';

class GoodsDetailDialog extends StatefulWidget {
  final int id;

  GoodsDetailDialog({Key key, this.id}) : super(key: key);

  _GoodsDetailDialogState createState() => _GoodsDetailDialogState();
}

class _GoodsDetailDialogState extends State<GoodsDetailDialog> {
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
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
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12),
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[_initOption(), _line(), _initGoodsDesc()],
              )),
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
          border: Border(
            bottom:
                BorderSide(color: Color.fromRGBO(242, 242, 242, 1), width: 1),
          ),
        ),
      ),
    );
  }

  /// 选项
  _initOption() {
    return Column(
      children: <Widget>[
        Column(
          children: [SelectRow(), SelectRow(), SelectRow()],
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
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '商品描述',
                  style: TextStyle(
                      color: Color.fromRGBO(56, 56, 56, 1), fontSize: 13),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "flutter luckin coffee application（仿瑞幸咖啡）",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(128, 128, 128, 1),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /// 结算总价
  Widget _initAccount() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromRGBO(242, 242, 242, 1), width: 1),
          bottom: BorderSide(color: Color.fromRGBO(242, 242, 242, 1), width: 1),
        ),
        color: Colors.white,
      ),
      height: 60,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '￥ 28.0',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(56, 56, 56, 1)),
                ),
              ),
              AStepper(
                value: 23,
                min: 1,
                onChange: (num val) {},
              )
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '金枪鱼三明治 大,热,糖',
              style:
                  TextStyle(color: Color.fromRGBO(80, 80, 80, 1), fontSize: 10),
            ),
          )
        ],
      ),
    );
  }

  /// 底部
  Widget _initFooter() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: Colors.white,
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AButton.icon(
            icon: Icon(
              Icons.card_giftcard_outlined,
              size: 14,
            ),
            textChild: Text(
              '充2赠1',
              style: TextStyle(fontSize: 12),
            ),
            color: Colors.white,
            bgColor: Color.fromRGBO(255, 129, 2, 1),
            height: 32,
            onPressed: () => {},
          ),
          AButton.icon(
            height: 32,
            icon: Icon(
              Icons.favorite_border,
              size: 16,
            ),
            textChild: Text(
              '收藏口味',
              style: TextStyle(fontSize: 12),
            ),
            color: Color.fromRGBO(136, 175, 213, 1),
            bgColor: Color.fromRGBO(136, 175, 213, 0.3),
            onPressed: () => {},
          ),
          AButton.icon(
            height: 32,
            icon: Icon(
              Icons.shopping_cart,
              size: 16,
            ),
            bgColor: Color.fromRGBO(136, 175, 213, 1),
            color: Colors.white,
            textChild: Text(
              '加入购物车',
              style: TextStyle(fontSize: 12),
            ),
            onPressed: () async {
              /// HACK: 加入购物车
            },
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
              color: bgColor == null ? Color.fromRGBO(0, 0, 0, 0.3) : bgColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: icon),
      onTap: () {
        if (onPress != null) {
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
                color: Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Icon(
              Icons.close,
              size: 16,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ));
  }

  /// 头部
  Widget _initHeader() {
    return Stack(
      children: <Widget>[
        Container(
          width: 335,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.asset(
              'lib/assets/images/menu/dialog1.jpg',
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),

        _initClose(),

        // 收藏
        Positioned(
            left: 10,
            top: 10,
            child: _circelIcon(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 16,
                color: Colors.white,
              ),
            )),

        // 标题
        Positioned(
          left: 15,
          bottom: 15,
          child: Column(
            children: <Widget>[
              Text(
                '金枪鱼三明治',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Nice tuna SandWich',
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
