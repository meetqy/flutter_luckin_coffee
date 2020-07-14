import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goods_category/data.dart';
import 'package:flutter_luckin_coffee/utils/global.dart';

class Category extends StatelessWidget {
  final List<GoodsCategoryDatum> data;
  final Function getCayegoryId;
  final int id;

  const Category({Key key, this.data, @required this.getCayegoryId, this.id})
      : super(key: key);

  List<Widget> _render() {
    List<Widget> widgets = [];
    data.forEach((val) {
      widgets.add(InkWell(
        key: Key('${val.id}'),
        onTap: () => getCayegoryId(val.id),
        child: Container(
          alignment: Alignment.center,
          height: 44,
          decoration: BoxDecoration(
              border: G.borderBottom(show: id == val.id),
              color: hex('#fff').withOpacity(id == val.id ? 1.0 : 0.0)),
          child: Text(val.name),
        ),
      ));
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _render(),
    );
  }
}
