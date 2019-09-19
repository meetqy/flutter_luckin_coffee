import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/acheckbox/CheckBoxRender.dart';

class ACheckBox extends StatelessWidget {
  const ACheckBox({
    Key key,
    this.title,
    this.titlePosition = 'right',
    this.onChanged,
    this.value,
    this.tristate = false,
    this.activeColor,
    this.checkColor,
    this.width = 18.0,
    this.strokeWidth = 2.0,
    this.radius,
    this.mainAxisAlignment
  }) : super(key: key);

  final bool value;
  final double width;
  final double strokeWidth;
  final Radius radius;
  final bool tristate;
  final ValueChanged<bool> onChanged;
  final Widget title;
  final String titlePosition;
  final Color activeColor;
  final Color checkColor;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    print(radius);
    final Widget control = CheckBoxRender(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      width: width,
      radius: radius,
      tristate: tristate,
      value: value,
      checkColor: checkColor,
      strokeWidth: strokeWidth,
      activeColor: activeColor,
      onChanged: (bool value) => onChanged != null ? onChanged(value) : null,
    );

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        child: Row(
          mainAxisAlignment: mainAxisAlignment == null ? MainAxisAlignment.start : mainAxisAlignment,
          children: _renderContent(control),
        ),
      ),
      onTap: () => onChanged != null ? onChanged(!value) : null,
    );
  }

  List<Widget> _renderContent(Widget control) {
    if(titlePosition == 'left') {
      return [
        Container(child: title,),
        Container(
          width: width,
          height: width,
          child: control
        ),
      ];
    } else {
      return [
        Container(
          width: width,
          height: width,
          child: control
        ),
        Container(child: title,),
      ];
    }
  }
}