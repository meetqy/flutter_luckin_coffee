import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';
import 'package:flutter_luckin_coffee/utils/customAppbar.dart';

class UserAgreement extends StatelessWidget {
  const UserAgreement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context,title: "用户协议"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: G.screenWidth(),
          child: Column(children: <Widget>[
            Text('''尊敬的客户，在您下载luckin coffee程序( 下称“APP")
使用我们的服务前，请仔细阅读本用户协议。
用户协议
本协议是您与瑞幸咖啡(北京)有限公司(以下简称“瑞
幸咖啡”)签署的《用户协议》。您下载本APP并成功注
册后，即被视为已阅读、理解、接受本协议条款。本协
议可由我们不时作出修订，且构成您与我们之间达成的有
关APP使用、具有约束力的协议。您在修订发布后继续使
用APP，即视为您已接受了相关修订。如果您不同意本
协议或相关修订，则应立即卸载本APP。
如果您不满十八(18) 周岁，您应确保与您的父母或监
护人共同阅读本协议，以便您及您的父母或监护人理解并
同意本协议的内容。
1.用户许可
1.1.我们允许您在本协议范围内享有个人的、非排他性
的、不可转让的使用本APP的权利。但是您不得有以下行
为:
1.1.1.以任何方式出售、转让、分发、修改或传播APP或
与APP有关的文字、图片、音乐、条形码、视频、数据、
超链接、展示及其他内容(“内容") ;
1.1.4.利用服务或APP程序进行违法犯罪活动;
1.1.5.利用服务或APP程序侵犯他人合法权益;
1.1.6.利用服务或APP程序影响网络的正常运行;
1.1.7.损害APP程序数据的完整性或性能。
本用户许可同样适用于本APP的任何更新、补充或替代产
品，但相关更新、补充或替代产品中有相反规定的除外。
1.2.如果我们认为您存在任何违反本协议的行为或存在其
他损害APP的行为，我们保留在不另行通知的情况下随时
禁止您继续使用APP和相关服务的权利。
2.注册帐号、密码及安全性
2.1.注册资格您承诺:您具有完全民事权利能力和行为
能力或虽不具有完全民事权利能力和行为能力但经您的法
定代理人同意并由其代理注册APP服务。
2.2.注册流程:您同意根据APP注册页面的要求提供手机
号码并通过认证程序注册账号，或者通过微信授权快速注
册账号。您将对账户安全负全部责任。另外，每个用户
都要对以其用户名进行的所有活动和事件负全责。
2.3.您成功注册后，您同意接收我们发送的与APP管理、
运营相关的微信订阅号和/或客户端消息和/或电子邮件和/
或短消息。
2.4.注册成功后，您有权根据APP相关页面公示的服务规
称“瑞幸咖啡标志"。与 APP相关的其他商标、服务标
志、图像和标识为其各自所有人的商标(统称“第三方标
志")
未经瑞幸咖啡或相关商标持有人的事先书面许
可，用户不得全部或部分地复制、模仿或使用瑞幸咖啡标
志或第三方标志。APP和内容受到与著作权、商标、专
利、商业秘密及其他专有权利相关的国际条约、法律、法
规、行政规章等规定的保护，您可在瑞幸咖啡或内容所有
人授权的情况下使用包含保护数字信息的安全组件。
6.合约期限及变更、终止
6.1我们和您订立的这份协议是无固定期限协议。
6.2您有权在结清全部应付费用后，随时通过永久性删除
移动设备上安装的APP程序来终止协议。
6.3我们保留随时修改或替换本协议，或者更改、暂停服
务及APP程序(包括但不限于任何功能、数据库或内容)
的权利。
7.其他
7.1本用户协议部分条款或附件无效或终止的，我们有权
根据具体情况选择是否继续履行其他条款。
7.2本协议适用中国法律。本协议履行中发生的任何争
议，由瑞幸咖啡所在地人民法院管辖。''', style: TextStyle(
    color: rgba(56, 56, 56, 1),
    fontSize: 14,
    height: 1.4
  ),),
  Container(
    padding: EdgeInsets.only(right: 10),
    child: Row(children: <Widget>[
      Expanded(child: 
        Text('瑞幸咖啡(北京)有限公司',
          style: TextStyle(
            fontSize: 14,
            color: rgba(56,56,56,1)
          ),
          textAlign: TextAlign.right,
        )
      ,)
    ],),
  )
  
          ],),
        ),
        )
      ),
    );
  }
}