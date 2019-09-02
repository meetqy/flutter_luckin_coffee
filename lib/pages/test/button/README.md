<!--
 * @Author: meetqy
 * @since: 2019-09-02 15:23:17
 * @lastTime: 2019-09-02 16:01:18
 * @LastEditors: meetqy
 -->
# Button按钮

对项目中使用的button按钮进行的一个封装。主要有3类普通按钮（normal）,icon按钮（icon），加载按钮（loading）。

<img src="./button.PNG" width="375"/>

## normal

- 使用

``` dart
Button.normal(
  child: Text('默认按钮'),onPressed: (){}
)
```

- 参数

```dart
@param {double} width 宽度
@param {double} height  高度
@param {String} type  按钮类型：default，primary，info，danger，warning
@param {Color} color  文字颜色
@param {Color} bgColor  背景颜色
@param {Color} borderColor  边框颜色
@param {bool} plain 是否使用边框样式
@param {VoidCallback} onPressed 点击回调 如果没有该参数表示不可点击状态
@param {Widget} child 按钮内容
@param {EdgeInsetsGeometry} padding 内边距
@param {BorderRadius} borderRadius  圆角
```

## icon

- 使用

``` dart
Button.icon(
  width: 44,icon: xxx,type: 'primary',onPressed: (){}
)
```

- 参数

```dart
@param {double} width 宽度
@param {double} height  高度
@param {String} type  按钮类型：default，primary，info，danger，warning
@param {Color} color  文字颜色
@param {Color} bgColor  背景颜色
@param {Color} borderColor  边框颜色
@param {bool} plain 是否使用边框样式
@param {VoidCallback} onPressed 点击回调 如果没有该参数表示不可点击状态
@param {Widget} textChild 按钮内容
@param {Widget} icon icon
@param {EdgeInsetsGeometry} padding 内边距
@param {BorderRadius} borderRadius  圆角
```

## loading

- 使用

``` dart
Button.loading(
  width: 44,type: 'primary',onPressed: (){},
)
```

- 参数

``` dart 
@param {double} width 宽度
@param {double} height  高度
@param {String} type  按钮类型：default，primary，info，danger，warning
@param {Color} color  加载动画颜色颜色
@param {Color} bgColor  背景颜色
@param {Color} borderColor  边框颜色
@param {bool} plain 是否使用边框样式
@param {VoidCallback} onPressed 点击回调 如果没有该参数表示不可点击状态
@param {Widget} loadingChild 按钮内容
@param {EdgeInsetsGeometry} padding 内边距
@param {BorderRadius} borderRadius  圆角
```






