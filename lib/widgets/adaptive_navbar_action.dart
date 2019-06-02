import 'package:flutter/widgets.dart';

import 'adaptive_widget.dart';

class AdaptiveNavBarAction extends AdaptiveWidget<Widget, Widget> {
  final Color cupertinoIconColor;
  final IconData cupertinoIcon;
  final Function cupertinoOnClick;

  AdaptiveNavBarAction({this.cupertinoIconColor, this.cupertinoIcon, this.cupertinoOnClick});

  @override
  Widget buildCupertinoWidget() {
    return GestureDetector(
      onTap: cupertinoOnClick,
      child: Icon(
        cupertinoIcon,
        color: cupertinoIconColor,
      ),
    );
  }

  @override
  Widget buildMaterialWidget() {
    return null;
  }
}
