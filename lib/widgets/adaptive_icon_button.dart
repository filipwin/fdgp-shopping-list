import 'package:flutter/widgets.dart';

import 'adaptive_widget.dart';

class AdaptiveIconButton extends AdaptiveWidget<Widget, Widget> {
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final Color materialColor;
  final Color cupertinoColor;
  final Function onClick;

  AdaptiveIconButton({
    this.materialIcon,
    this.cupertinoIcon,
    this.materialColor,
    this.cupertinoColor,
    this.onClick,
  });

  @override
  Widget buildCupertinoWidget() {
    return _buildCommon(
      Icon(
        cupertinoIcon,
        color: cupertinoColor,
      ),
    );
  }

  @override
  Widget buildMaterialWidget() {
    return _buildCommon(
      Icon(
        materialIcon,
        color: materialColor,
      ),
    );
  }

  Widget _buildCommon(Widget icon) {
    return GestureDetector(
      onTap: onClick,
      child: icon,
    );
  }
}
