import 'package:flutter/widgets.dart';

import 'adaptive_const.dart' as constants;
import 'adaptive_widget.dart';

class AdaptiveListItem extends AdaptiveWidget<Widget, Widget> {
  final Color cellColor;
  final BoxShadow materialShadow;
  final BorderRadius materialBorderRadius;
  final Widget content;

  AdaptiveListItem({this.cellColor, this.materialShadow, this.materialBorderRadius, this.content});

  @override
  Widget buildCupertinoWidget() {
    return Padding(
      padding: constants.listItemPadding,
      child: Container(
        color: cellColor,
        child: content,
      ),
    );
  }

  @override
  Widget buildMaterialWidget() {
    return Padding(
      padding: constants.listItemPadding,
      child: Container(
        decoration: BoxDecoration(
          color: cellColor,
          boxShadow: [materialShadow],
          borderRadius: materialBorderRadius,
        ),
        child: content,
      ),
    );
  }
}
