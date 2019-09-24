import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class DacaiSay extends StatelessWidget {
  final String avatar;
  final String name;
  final String label;
  final String desc;
  final String time;

  /// 大咖说
  /// 
  /// ```
  /// @param {String} avatar - 头像
  /// @param {String} name - 名字
  /// @param {String} label - 标签
  /// @param {String} desc - 描述
  /// @param {String} time - 时间
  /// ```
  DacaiSay({
    this.avatar,
    this.name,
    this.label = '',
    this.desc = '',
    this.time = ''
  }) : assert(
    avatar!=null,
    name!=null,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.only(top: 6),
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: G.borderBottom()
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(30),
                child: Image.asset(avatar, width: 30, height: 30, fit: BoxFit.cover,),
              ),
            ),

            Expanded(child: 
              Container(
                margin: EdgeInsets.only(top: 10,left: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(name, style: TextStyle(
                            fontSize: 12
                          ),),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: rgba(242, 242, 242, 1)
                            ),
                            margin: EdgeInsets.only(left: 5),
                            child: Text(label, style: TextStyle(
                              color: rgba(53, 60, 177, 1),
                              fontSize: 10
                            ),),
                          )
                      ],),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        children: <Widget>[
                          Wrap(children: <Widget>[
                            Text(desc,
                              style: TextStyle(
                                fontSize: 12,
                                color: rgba(128, 128, 128, 1)
                              ),
                            ),
                          ],)
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(time, style: TextStyle(
                        color: rgba(136, 175, 213, 1),
                        fontSize: 12
                      ),),
                    )
                  ],
                ),
              ) 
            ,)
              
          ],
        ),
      ),
    );
  }
}