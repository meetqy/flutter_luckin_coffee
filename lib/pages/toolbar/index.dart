import 'package:flutter/material.dart';

class Toolbar extends StatefulWidget {
  Toolbar({Key key, Map arguments}) : super(key: key);

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('toolbar')),
    );
  }
}
