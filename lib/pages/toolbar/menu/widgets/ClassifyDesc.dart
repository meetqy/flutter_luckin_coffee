/*
 * @Author: meetqy
 * @since: 2019-08-10 17:19:04
 * @lastTime: 2019-08-12 10:42:54
 * @LastEditors: meetqy
 */
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class ClassifyDesc extends StatelessWidget {
  final String name;
  final String desc;

  /// 创建商品列表显示的分类介绍 每一类商品顶部有一个对该类商品的介绍
  /// ```
  /// @param {String} name - 名字
  /// @param {String} desc - 描述
  /// ```
  ClassifyDesc(this.name, {
    this.desc
  });

  
  _createNotDesc(String name) {
    return Container(child: 
      Row(children: <Widget>[
        Text(name, style: TextStyle(
          fontSize: 12, 
          color: rgba(56, 56, 56, 1),
          fontWeight: FontWeight.bold
        ),),
        Expanded(child: 
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 1,
            color: rgba(242, 242, 242, 1),
          )
        ,)
      ],)
    );
  }

  _create(String name, String desc) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Expanded(child: Text(name, style: TextStyle(
          fontSize: 12, 
          color: rgba(56, 56, 56, 1),
          fontWeight: FontWeight.bold
        ),),)
      ],),

      Row(children: <Widget>[
        Text(desc, style: TextStyle(
          fontSize: 10, 
          color: rgba(166, 166, 166, 1),
        ),),
        Expanded(child: 
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 1,
            color: rgba(242, 242, 242, 1),
          )
        ,)
      ],)
    ],);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: desc == null ? _createNotDesc(name) : _create(name, desc),
    );
  }
}

