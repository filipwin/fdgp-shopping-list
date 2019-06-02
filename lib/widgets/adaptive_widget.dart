import 'dart:io';

import 'package:flutter/widgets.dart';

abstract class AdaptiveWidget<M extends Widget, C extends Widget> extends StatelessWidget {
  M buildMaterialWidget();
  C buildCupertinoWidget();

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS)
      return buildCupertinoWidget();
    else
      return buildMaterialWidget();
  }
}
