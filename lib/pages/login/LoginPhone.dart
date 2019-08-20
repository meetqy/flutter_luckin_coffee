import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_luckin_coffee/utils/Icon.dart';
import 'package:flutter_luckin_coffee/utils/commonUI.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';
import 'package:flutter_luckin_coffee/utils/other.dart';
import 'package:flutter_luckin_coffee/widgets/Button/index.dart';

class LoginPhone extends StatefulWidget {
  LoginPhone({Key key}) : super(key: key);

  _LoginPhoneState createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  static Map phoneNum = {
    "value": null,
    "verify": true
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(context: context, borderBottom: false),
      body: Container(
        width: screenWidth(context),
        color: hex('#fff'),
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 26),
            width: 80,
            height: 94,
            child: Image.asset('lib/assets/images/logo1.png', fit: BoxFit.cover,),
          ),
          
          Container(
            margin: EdgeInsets.only(top: 57),
            height: 58,
            decoration: BoxDecoration(
              border: ui.borderBottom()
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Text('选择国家/地区', style: TextStyle(
                    color: rgba(128, 128, 128, 1),
                    fontSize: 14
                  ),),
                  Container(  
                    margin: EdgeInsets.only(left: 5),
                    child: Text('中国（+86）', style: TextStyle(
                      color: rgba(56, 56, 56, 1),
                      fontSize: 14
                    ),),
                  )
                ],),
                icontupian6(color: rgba(228, 228, 228, 1), size: 14)
            ],),
          ),

          TextField(
            maxLength: 11,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              counterText: "",
              enabledBorder: UnderlineInputBorder(      
                borderSide: BorderSide(color: rgba(242, 242, 242, 1)),   
              ),
              focusedBorder: UnderlineInputBorder(      
                borderSide: BorderSide(color: rgba(242, 242, 242, 1)),   
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 20),   
              hintText: '请输入手机号',
              hintStyle: TextStyle(fontSize: 14,)
            ),
            onChanged: (e) {
              RegExp regExp = RegExp(r"^1\d{10}$");
              print(phoneNum['verify']);
              setState(() {
                phoneNum['value'] = e;
                phoneNum['verify'] = regExp.hasMatch(e);
              });
            },
          ),

          Container(
            decoration: BoxDecoration(
              border: ui.borderBottom()
            ),
            child: Row(children: <Widget>[
              Flexible(
                child: TextField(
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20),   
                    hintText: '请输入手机验证码',
                    hintStyle: TextStyle(fontSize: 14,)
                  ),
                ),
              ),
              InkWell(
                child: Text('获取验证码',style: TextStyle(
                  color: phoneNum['verify'] && phoneNum['value']!=null ? rgba(85, 122, 157, 1) : rgba(166, 166, 166, 1),
                  fontSize: 14
                ),),
                onTap: (){
                  // 获取验证码
                  if(phoneNum['verify'] && phoneNum['value']!=null) {
                    
                  }
                },
              )
            ],),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Button.bigButton(
              "确定",
              bgColor: rgba(136, 175, 213, 0.6),
              color: hex('#fff'),
              onPress: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: <Widget>[
                Text('点击确定，即表示以阅读并同意', style: TextStyle(
                  fontSize: 12,
                  color: rgba(128, 128, 128, 1)
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