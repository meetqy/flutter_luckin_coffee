
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class LoginMail extends StatefulWidget {
  LoginMail({Key key}) : super(key: key);

  _LoginMailState createState() => _LoginMailState();
}

class _LoginMailState extends State<LoginMail> {
  static Map email = {"value": null, "verify": true};
  static Map code = {"value": null, "verify": true};

  /// 开始倒计时 时间
  int startTime;

  /// 当前倒计时 时间
  int countDownTime = 0;

  /// 总倒计时时长
  final int speed = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(context: context, borderBottom: false),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 35, right: 35, top: 87),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 80,
              height: 94,
              child: Image.asset(
                'lib/assets/images/logo1.png',
                fit: BoxFit.cover,
              ),
            ),

            /// 输入邮箱
            Container(
              height: 55,
              decoration: BoxDecoration(border: cuBorderBottom()),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    hintText: '请输入邮箱',
                    hintStyle: TextStyle(
                      fontSize: 14,
                    )),
                onChanged: (e) {},
              ),
            ),

            /// 验证码
            Container(
              height: 55,
              decoration: BoxDecoration(border: cuBorderBottom()),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText: '请输入邮箱验证码',
                          hintStyle: TextStyle(
                            fontSize: 14,
                          )),
                      onChanged: (e) {
                        setState(() {
                          code['value'] = e;
                          code['verify'] = e.length == 4 ? true : false;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: Color.fromRGBO(242, 242, 242, 1)))),
                  ),
                  buildGetEmailCode()
                ],
              ),
            ),

            /// 确认
            Container(
              margin: EdgeInsets.only(top: 20),
              child: AButton.normal(
                width: 300,
                child: Text('确定'),
                bgColor: Color.fromRGBO(136, 175, 213, 1),
                color: Colors.white,
                onPressed: () {},
              ),
            ),

            /// 协议
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '点击确定，即表示以阅读并同意',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(153, 153, 153, 1)),
                  ),
                  InkWell(
                    child: Text(
                      '《注册会员服务条款》',
                      style: TextStyle(
                          color: Color.fromRGBO(85, 122, 157, 1), fontSize: 12),
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, '/user_agreement'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 获取验证码
  Container buildGetEmailCode() {
    return Container(
      child: AButton.normal(
          child: Text(countDownTime <= 0
              ? "获取验证码"
              : countDownTime < 10
                  ? '0$countDownTime'
                  : '$countDownTime'),
          color: email['verify'] && email['value'] != null
              ? Color.fromRGBO(85, 122, 157, 1)
              : Color.fromRGBO(166, 166, 166, 1),
          onPressed: () {
            if (countDownTime > 0) return;

            /// HACK: 获取验证码
          }),
    );
  }
}
