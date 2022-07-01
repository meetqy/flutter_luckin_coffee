import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:get/get.dart';

class LoginMethod extends StatelessWidget {
  const LoginMethod({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context, borderBottom: false),
      body: Container(
        width: Get.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 26),
              width: 80,
              height: 94,
              child: Image.asset(
                'lib/assets/images/logo1.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 116),
              child: AButton.normal(
                width: 300,
                child: Text('微信一键登录'),
                color: Colors.white,
                bgColor: Color.fromRGBO(73, 194, 101, 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: AButton.normal(
                  width: 300,
                  child: Text('邮箱验证码登录'),
                  color: Color.fromRGBO(136, 175, 213, 1),
                  bgColor: Colors.white,
                  borderColor: Color.fromRGBO(136, 175, 213, 1),
                  plain: true,
                  onPressed: () => Get.toNamed('/login_mail')),
            ),
          ],
        ),
      ),
    );
  }
}
