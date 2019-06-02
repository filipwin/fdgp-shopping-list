import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_widget.dart';

class AdaptiveSlider extends AdaptiveWidget<Slider, CupertinoSlider> {
  final double value;
  final ValueChanged<double> onChanged;

  AdaptiveSlider({this.value, this.onChanged});

  @override
  CupertinoSlider buildCupertinoWidget() {
    return CupertinoSlider(
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Slider buildMaterialWidget() {
    return Slider(
      value: value,
      onChanged: onChanged,
    );
  }
}
