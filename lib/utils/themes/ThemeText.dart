import 'package:flutter/material.dart';

class ThemeText extends StatelessWidget {
  final String text;
  final Color color;

  const ThemeText(this.text, {
    Key key,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$text', style: TextStyle(
      color: color
    ),);
  }
}