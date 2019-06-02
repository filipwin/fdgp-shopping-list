import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_widget.dart';

class AdaptiveTopBar extends AdaptiveWidget<AppBar, CupertinoNavigationBar> implements ObstructingPreferredSizeWidget {
  final Text title;
  final Widget cupertinoRightAction;
  final Color cupertinoBackgroundColor;

  AdaptiveTopBar({this.title, this.cupertinoRightAction, this.cupertinoBackgroundColor});

  @override
  CupertinoNavigationBar buildCupertinoWidget() {
    return CupertinoNavigationBar(
      middle: title,
      trailing: cupertinoRightAction,
      backgroundColor: cupertinoBackgroundColor,
    );
  }

  @override
  AppBar buildMaterialWidget() {
    return AppBar(
      title: title,
    );
  }

  ///Dummy implementations, just to get rid of
  ///'AdaptiveTopBar' is not a subtype of ObstructingPreferredSizeWidget crash.

  @override
  // TODO: implement fullObstruction
  bool get fullObstruction => false;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Platform.isIOS ? 44 : 56);
}
