import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/utils/other.dart';
import 'package:flutter_luckin_coffee/widgets/Button/index.dart';

class LoginMethod extends StatelessWidget {
  const LoginMethod({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context, borderBottom: false),

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
            child: Button.bigButton(
              "微信一键登录",
              bgColor: rgba(73, 194, 101, 1),
              color: hex('#fff'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Button.bigButton(
              "手机验证码登录",
              color: rgba(136, 175, 213, 1),
              bgColor: hex('#fff'),
              border: Border.all(width: 1,color: rgba(136, 175, 213, 1)),
              onPress: () {
                Navigator.pushNamed(context, '/login_phone');
              },
            ),
          ),
          
        ],),
      ),
    );
  }
}