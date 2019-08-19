import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/other.dart';

class LoginMethod extends StatelessWidget {
  const LoginMethod({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hex('#fff'),
        elevation: 0,
        leading: InkWell(
          child: icontupian8(color: rgba(44, 44, 44, 1), size: 16),
          onTap: (){
            Navigator.pop(context);
          },
        )
        
        
      ),
      body: Container(
        width: screenWidth(context),
        color: hex('#fff'),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 26),
            width: 80,
            height: 94,
            child: Image.asset('lib/assets/images/logo1.png', fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.only(top: 116),
            width: 300,
            height: 44,
            decoration: BoxDecoration(
              color: rgba(73, 194, 101, 1),
              borderRadius: BorderRadius.circular(4)
            ),
            alignment: Alignment.center,
            child: Text('微信一键登录', style: TextStyle(fontSize: 16, color: rgba(255, 255, 255, 1)),),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            width: 300,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1,color: rgba(136, 175, 213, 1))
            ),
            alignment: Alignment.center,
            child: Text('手机验证码登录', style: TextStyle(fontSize: 16, color: rgba(136, 175, 213, 1)),),
          ),
        ],),
      ),
    );
  }
}