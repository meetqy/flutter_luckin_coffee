import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/stand_ui/stand_button/index.dart';

class ExampleStandButton extends StatefulWidget {
  ExampleStandButton({Key key}) : super(key: key);

  @override
  _ExampleStandButtonState createState() => _ExampleStandButtonState();
}

class _ExampleStandButtonState extends State<ExampleStandButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stand_button'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// 按钮类型
                Column(
                  children: <Widget>[
                    buildTitle('按钮类型'),
                    Wrap(
                      children: <Widget>[
                        buildContainer(
                          child: StandButton(
                            text: Text('默认按钮'),
                            onPressed: () => print('默认按钮'),
                          )
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.primary,
                            text: Text('主要按钮'),
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.info,
                            text: Text('信息按钮'),
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.danger,
                            text: Text('危险按钮'),
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.warning,
                            text: Text('警告按钮'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                /// 朴素按钮
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle('朴素按钮'),
                    Wrap(
                      children: <Widget>[
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.primary,
                            text: Text('主要按钮'),
                            plain: true,
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.info,
                            text: Text('信息按钮'),
                            plain: true,
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.danger,
                            text: Text('危险按钮'),
                            plain: true,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              
                /// 禁用状态
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle('禁用状态'),
                    Wrap(
                      children: <Widget>[
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.primary,
                            text: Text('禁用状态'),
                            disabled: true,
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.info,
                            text: Text('禁用状态'),
                            plain: true,
                            disabled: true,
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.danger,
                            text: Text('禁用状态'),
                            disabled: true,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                /// 按钮尺寸
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle('按钮尺寸'),
                    Wrap(
                      children: <Widget>[
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.primary,
                            text: Text('禁用状态'),
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.info,
                            text: Text('禁用状态'),
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            type: ButtonType.danger,
                            text: Text('禁用状态'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                /// 加载状态
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle('加载状态'),
                    Wrap(
                      children: <Widget>[
                        buildContainer(
                          child: StandButton.loading(
                            type: ButtonType.primary,
                            onPressed: () {
                              print('123');
                            }
                          ),
                        ),

                        buildContainer(
                          child: StandButton.loading(
                            loadingText: Text('加载中...')
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                /// 按钮尺寸
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle('按钮尺寸'),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        buildContainer(
                          child: StandButton(
                            text: Text('大号按钮'),
                            type: ButtonType.primary,
                            size: ButtonSize.large,
                          ),
                        ),

                        buildContainer(
                          child: StandButton(
                            text: Text('普通按钮'),
                            type: ButtonType.primary,
                          ),
                        ),

                        buildContainer(
                          child: StandButton(
                            text: Text('小型按钮'),
                            type: ButtonType.primary,
                            size: ButtonSize.small,
                          ),
                        ),

                        buildContainer(
                          child: StandButton(
                            text: Text('迷你按钮'),
                            type: ButtonType.primary,
                            size: ButtonSize.mini,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                /// 自定义颜色
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle('自定义颜色'),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        buildContainer(
                          child: StandButton(
                            text: Text('渐变色按钮'),
                            size: ButtonSize.large,
                            type: ButtonType.primary,
                            gradientColor: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                rgba(75,176,255,1),
                                rgba(97,73,246,1),
                              ]
                            ),
                          )
                        ),

                        buildContainer(
                          child: StandButton(
                            text: Text('单色按钮'),
                            color: rgba(114, 50, 221, 1),
                          ),
                        ),

                        buildContainer(
                          child: StandButton(
                            text: Text('单色按钮'),
                            size: ButtonSize.small,
                            plain: true,
                            color: rgba(114, 50, 221, 1),
                          ),
                        ),
                        buildContainer(
                          child: StandButton(
                            text: Text('单色按钮'),
                            size: ButtonSize.mini,
                            plain: true,
                            color: hex('#13bb87'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer({Widget child}) {
    return Container(
      margin: EdgeInsets.only(right: 8, bottom: 8),
      child: child
    );
  }

  Row buildTitle(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Text('$text')
        ),
      ],
    );
  }
}