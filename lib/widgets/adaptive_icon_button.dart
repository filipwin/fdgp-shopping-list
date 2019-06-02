import 'package:flutter/widgets.dart';

import 'adaptive_widget.dart';

class AdaptiveIconButton extends AdaptiveWidget<Widget, Widget> {
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final Color materialColor;
  final Color cupertinoColor;
  final Function onClick;
  final double size;

  AdaptiveIconButton({
    this.materialIcon,
    this.cupertinoIcon,
    this.materialColor,
    this.cupertinoColor,
    this.onClick,
    this.size = 24,
  });

  @override
  Widget buildCupertinoWidget() {
    return _buildCommon(
      Icon(
        cupertinoIcon,
        color: cupertinoColor,
        size: size,
      ),
    );
  }

  @override
  Widget buildMaterialWidget() {
    return _buildCommon(
      Icon(
        materialIcon,
        color: materialColor,
        size: size,
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
