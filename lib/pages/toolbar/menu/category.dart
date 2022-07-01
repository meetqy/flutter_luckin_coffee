// import 'package:flutter/material.dart';
// import 'package:flutter_luckin_coffee/jsonserialize/goods_category/data.dart';
// import 'package:flutter_luckin_coffee/mock/goods_category.dart';
// import 'package:flutter_luckin_coffee/utils/global.dart';

// class Category extends StatelessWidget {
//   final Function getCayegoryId;
//   final int id;

//   const Category({Key key, @required this.getCayegoryId, this.id})
//       : super(key: key);

//   List<Widget> _render() {
//     List<Widget> widgets = [];
//     Mocksssss.forEach((val) {
//       var index = Mocksssss.indexOf(val);
//       widgets.add(InkWell(
//         key: Key('$index'),
//         onTap: () => getCayegoryId("$index"),
//         child: Container(
//           alignment: Alignment.center,
//           height: 44,
//           decoration: BoxDecoration(
//               border: cuBorderBottom(show: id == index),
//               color: Color(0xffffff).withOpacity(id == index ? 1.0 : 0.0)),
//           child: Text(val),
//         ),
//       ));
//     });

//     return widgets;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: _render(),
//     );
//   }
// }
