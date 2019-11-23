import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/stand_ui/stand_button/index.dart';

class Loading extends StandButton {
  Loading({
    Key key,
    Widget text,
    ButtonType type = ButtonType.primary
  }) : super(
    key: key,
    type: type,
    text: text
  );
}