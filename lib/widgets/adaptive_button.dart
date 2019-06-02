import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_widget.dart';

class AdaptiveButton extends AdaptiveWidget<MaterialButton, CupertinoButton> {
  final bool materialIsFilled;
  final bool cupertinoIsFilled;
  final VoidCallback onClick;
  final Widget child;

  AdaptiveButton({
    this.materialIsFilled = false,
    this.cupertinoIsFilled = false,
    this.onClick,
    this.child,
  });

  @override
  CupertinoButton buildCupertinoWidget() {
    if (cupertinoIsFilled)
      return CupertinoButton.filled(
        child: child,
        onPressed: onClick,
      );
    else
      return CupertinoButton(
        child: child,
        onPressed: onClick,
      );
  }

  @override
  MaterialButton buildMaterialWidget() {
    if (materialIsFilled)
      return MaterialButton(
        child: child,
        onPressed: onClick,
      );
    else
      return FlatButton(
        child: child,
        onPressed: onClick,
      );
  }
}
