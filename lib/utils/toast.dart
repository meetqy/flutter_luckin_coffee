import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class Toast {
  _showDialog(BuildContext context, {
    WidgetBuilder builder
  }) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return pageChild;
            }
          ),
        );
      },
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: rgba(0, 0, 0, 0),
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
  }

  show(BuildContext context, String text) async {
    _showDialog(context, 
      builder: (context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets + const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: MediaQuery.removeViewInsets(
            removeLeft: true,
            removeTop: true,
            removeRight: true,
            removeBottom: true,
            context: context,
            child: Center(
              child: Material(
                elevation: 0,
                color: rgba(50, 50, 51, 0.7),
                borderRadius: BorderRadius.circular(4),
                type: MaterialType.card,
                child: Container(
                  width: null,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text('$text',
                    style: TextStyle(fontSize: 14, color: hex('#fff')),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );

    await G.sleep();

    G.pop();
  }
}