import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/a_button/index.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goods_detail/data.dart';

class SelectRow extends StatelessWidget {
  final GoodsDetailProperty data;
  final Function onChange;
  final int id;

  SelectRow({
    @required this.data,
    @required this.onChange,
    @required this.id,
  });

  Container _createRadio({
    GoodsDetailProperty item
  }) {
    bool isActive = id == item.id;
    return Container(
      key: Key('${item.id}'),
      margin: EdgeInsets.only(right: 10),
      child: AButton.normal(
        width: 80,
        height: 30,
        borderRadius: BorderRadius.circular(15),
        child: Text('${item.name}', style: TextStyle(fontSize: 12),),
        plain: !isActive,
        color: isActive ? hex('#fff') : rgba(204, 192, 180, 1),
        bgColor: isActive ? rgba(204, 192, 180, 1) : hex('#fff'),
        borderColor: isActive ? Colors.transparent : rgba(204, 192, 180, 1),
        onPressed: () {
          Map<String, dynamic> type = {
            "typeId": data.id,
            "childId": item.id,
            "typeName": data.name,
            "childName": item.name
          };

          onChange(type);
        }
      ),
    );
  }

  /// 初始化选项
  List<Widget> _initOptions() {
    List<Widget> widgets = [];
    data.childsCurGoods.forEach((GoodsDetailProperty item) {
      widgets.add(_createRadio(
        item: item
      ));
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6,bottom: 6),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 65,
                  alignment: Alignment.center,
                  height: 30,
                  child: Text('${data.name}', style: TextStyle(color: rgba(56, 56, 56, 1)),),
                ),
                Expanded(
                  child: Container(
                    child: Wrap(
                      children: _initOptions(),
                    )
                  )
                )
            ],),
          ),
        ],
      ),
    );
  }
}