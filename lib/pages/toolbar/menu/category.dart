import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/jsonserialize/goodscategory/data.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/widgets/MenuListRow.dart';

var s = 1;

class Category extends StatelessWidget {
  final List<GoodsCategoryDatum> data;
  final Function getCayegoryId;
  final int id;

  const Category({
    Key key,
    this.data,
    @required this.getCayegoryId,
    this.id
  }) : super(key: key);

  List<Widget> _render() {
    List<Widget> widgets = [];
    data.forEach((val) {
      widgets.add(MenuListRow(
        val.name,
        isActive: val.id == id,
        id: val.id,
        onPress: (id) => getCayegoryId(id),
      ));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    s+=1;
    return Column(
      children: _render(),
    );
  }
}