import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/components/acheckbox/CheckBoxRender.dart';

class ACheckBox extends StatelessWidget {
  /// 
  /// 注：其他参数和checkbox一样
  /// ```
  /// @param {Widget} title - 文本
  /// @param {String} titlePosition - 文本位置  left || right
  /// @param {double} width - 复选框大小
  /// @param {double} strokeWidth - 边框宽度
  /// @param {Raduis} radius - 圆角
  /// @param {MainAxisAlignment} mainAxisAlignment
  /// ```
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

    return Container(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          child: Row(
            mainAxisAlignment: mainAxisAlignment == null ? MainAxisAlignment.start : mainAxisAlignment,
            children: _renderContent(control),
          ),
        ),
        onTap: () => onChanged != null ? onChanged(!value) : null,
      ),
    );
  }

  List<Widget> _renderContent(Widget control) {

    /// 为什么title部分要使用Column包一层？
    /// 当title时文本的时候，外部的Container高度会变成text的高度，不能让外部的Container高度继承父级

    if(titlePosition == 'left') {
      return [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            title == null ? Container() : title
          ],
        ),
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            title == null ? Container() : title
          ],
        ),
      ];
    }
  }
}