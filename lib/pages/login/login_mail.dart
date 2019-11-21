import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';


class LoginMail extends StatefulWidget {
  LoginMail({Key key}) : super(key: key);

  _LoginMailState createState() => _LoginMailState();
}

class _LoginMailState extends State<LoginMail> {
  static Map email = {
    "value": null,
    "verify": true
  };
  static Map code = {
    "value": null,
    "verify": true
  };

  /// 获取验证码
  getEmailCode() async{
    try {
      var res = await G.req.verificationCode.getMailCode(
        mail: email['value']
      );
    } catch(e) {
      G.toast('获取验证码失败');
    }
  }

  /// 登录
  login() async{
    // if(!email['verify'] || email['value'] == null) {
    //   return G.toast('输入邮箱有误');
    // } 
    // if(!code['verify'] || code['value'] == null) {
    //   return G.toast('验证码不正确');
    // }

    try {
      var res = await G.req.user.register(
        autoLogin: true,
        pwd: '123456',
        email: email['value'],
        code: code['value']
      );

      // var data = await initDio().post('/user/email/register',
      //   queryParameters: {
      //     "code": code,
      //     "email": email,
      //     "pwd": 123456,
      //     "autoLogin": true
      //   });
      
      G.toast('登录成功');
    } catch(e) {
      print(e);
      G.toast('登录失败');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(context: context, borderBottom: false),
      body: Container(
        color: hex('#fff'),
        padding: EdgeInsets.only(left: 35, right: 35, top: 87),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 80,
              height: 94,
              child: Image.asset('lib/assets/images/logo1.png', fit: BoxFit.cover,),
            ),
            
            Container(
              height: 55,
              decoration: BoxDecoration(
                border: G.borderBottom()
              ),
              child: TextField(
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintText: '请输入邮箱',
                  hintStyle: TextStyle(fontSize: 14,)
                ),
                onChanged: (e) {
                  RegExp regExp = RegExp("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+");
                  setState(() {
                    email['value'] = e;
                    email['verify'] = regExp.hasMatch(e);
                  });
                },
              ),
            ),

            Container(
              height: 55,
              decoration: BoxDecoration(
                border: G.borderBottom()
              ),
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: '请输入邮箱验证码',
                      hintStyle: TextStyle(fontSize: 14,)
                    ),
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
                      left: BorderSide(color: rgba(242, 242, 242, 1))
                    )
                  ),
                ),

                Container(
                  child: AButton.normal(
                    child: Text('获取验证码'),
                    color: email['verify'] && email['value']!=null ? rgba(85, 122, 157, 1) : rgba(166, 166, 166, 1),
                    onPressed: email['verify'] && email['value']!=null ? getEmailCode : null
                  ),
                )
              ],),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: AButton.normal(
                width: 300,
                child: Text('确定'),
                bgColor: rgba(136, 175, 213, 1),
                color: hex('#fff'),
                onPressed: () => login()
              ),
            ),

            Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: <Widget>[
                Text('点击确定，即表示以阅读并同意', style: TextStyle(
                  fontSize: 12,
                  color: rgba(153, 153, 153, 1)
                ),),
                InkWell(
                  child: Text('《注册会员服务条款》', style: TextStyle(
                    color: rgba(85, 122, 157, 1),
                    fontSize: 12
                  ),),
                  onTap: () => Navigator.pushNamed(context, '/user_agreement'),
                )
            ],),
          )
        ],),
      ),
    );
  }
}