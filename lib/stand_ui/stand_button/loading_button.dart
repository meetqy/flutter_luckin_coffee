import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/stand_ui/stand_button/index.dart';

/// 加载图标类型
enum LoadingType {
  /// 环形
  circular,

  /// 菊花形
  spinner,
}

class LoadingButton extends StandButton {
  LoadingButton({
    Key key,
    ButtonType type = ButtonType.info,
    bool disabled = false,
    VoidCallback onPressed,
    this.iconSize = 20,
    this.loadingText,
    this.loadingType = LoadingType.circular,
  }) : super(
    key: key,
    type: type,
    text: loadingText,
    disabled: disabled,
    onPressed: onPressed
  );

  /// 加载图标大小
  final double iconSize;

  /// 加载图标右侧文字
  final Widget loadingText;

  /// 加载图标类型
  final LoadingType loadingType;

  @override
  EdgeInsets get padding => _initPadding();

  _initPadding() {
    if(loadingText == null) {
      return EdgeInsets.all(12);
    } else {
      return super.padding;
    }
  }

  @override
  Widget get icon => _initIcon();
  
  Widget _initIcon() {
    List colors = super.initColor();
    switch(loadingType) {
      default: 
        return SizedBox(
          width: iconSize,
          height: iconSize,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(colors[1]),
          ),
        );
    }
  }
}