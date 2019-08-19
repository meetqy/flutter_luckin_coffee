import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/commonUI.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class Mine extends StatefulWidget {
  static _MineState _mineState;
 
  getAppBar() => _mineState.createAppBar();

  Mine() {
    _mineState = _MineState();
  }
  
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {

  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: rgba(248, 248, 248, 1),
        child: Column(children: <Widget>[
          // 头部  
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/login_method');
            },
            child: Container(
              alignment: Alignment.centerLeft,
              height: 180,
              color: rgba(100, 68, 60, 1),
              padding: EdgeInsets.only(left: 20, right: 20,top: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(bottom: 20),
                    child: icontupian18(size: 24, color: rgba(255,255,255,.9))
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Row(children: <Widget>[
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(27),
                        child: Image.asset(
                          'lib/assets/images/mine/mine1.png', 
                          width: 55, 
                          height: 55, 
                          fit: BoxFit.cover,
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text('立即登录', style: TextStyle(
                          color: rgba(255, 255, 255, 1),
                          fontSize: 18
                        ),),
                      )
                    ],),
                    icontupian6(size: 14, color: rgba(255,255,255,.6))
                  ],),
                ],
              ),
            ),
          ),


          Container(
            color: hex('#fff'),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: <Widget>[
              MineRow('个人资料', icon: icontupian5(color: rgba(220, 220, 220, 1), size: 14),),
              MineRow('咖啡钱包', 
                icon: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: icontupian11(
                    color: rgba(220, 220, 220, 1), size: 20
                  ),
                )),
              MineRow('优惠券', icon: icontupian7(color: rgba(220, 220, 220, 1), size: 20),),
              MineRow('兑换优惠', icon: icontupian15(color: rgba(220, 220, 220, 1), size: 20),),
              MineRow('发票管理', 
                icon: icontupian9(color: rgba(220, 220, 220, 1), size: 20),
                borderBottom: false,
              ),
            ],),
          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: hex('#fff'),
            child: MineRow('帮助反馈', 
              icon: iconshoucang(color: rgba(220, 220, 220, 1), size: 20),
              borderBottom: false,
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset(
              'lib/assets/images/mine/mine2.jpg', 
              fit: BoxFit.cover,
            )
          )
        ],),
      ),
    );
  }
}

class MineRow extends StatelessWidget {
  final Widget icon;
  final String text;
  final bool borderBottom;

  MineRow(this.text, {
    this.icon,
    this.borderBottom = true
  }) : assert(icon != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: BoxDecoration(
        border: ui.borderBottom(show: borderBottom),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15),
              child: icon
            ),
            Text(text, style: TextStyle(
              color: rgba(56, 56, 56, 1),
              fontSize: 14
            ),)
          ],),

          icontupian6(color: rgba(228, 228, 228, 1), size: 14)
        
      ],),
    );
  }
}