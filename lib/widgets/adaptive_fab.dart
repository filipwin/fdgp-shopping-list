import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_widget.dart';

class AdaptiveFab extends AdaptiveWidget<FloatingActionButton, Widget> {
  final Widget materialChild;
  final Function materialOnPressed;

  AdaptiveFab({
    this.materialChild,
    this.materialOnPressed,
  });

  @override
  Widget buildCupertinoWidget() {
    return null;
  }

  @override
  FloatingActionButton buildMaterialWidget() {
    return FloatingActionButton(
      child: materialChild,
      onPressed: materialOnPressed,
    );
  }
}
