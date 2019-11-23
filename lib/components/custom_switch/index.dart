import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Function onChange;

  CustomSwitch({
    this.value = false,
    this.onChange
  });

  _CustomSwitchState createState() => _CustomSwitchState(this.value);
}

class _CustomSwitchState extends State<CustomSwitch> {
  static bool value;


  _CustomSwitchState(bool value) {
    value = value;
  }


  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      activeColor: rgba(136, 175, 213, 1),
      value: value,
      onChanged: (flag) {
        setState(() {
          value = flag;
        });
      },
    );
  }
}