import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_widget.dart';

class AdaptiveLoader extends AdaptiveWidget<CircularProgressIndicator, CupertinoActivityIndicator> {
  @override
  CupertinoActivityIndicator buildCupertinoWidget() => CupertinoActivityIndicator();

  @override
  CircularProgressIndicator buildMaterialWidget() => CircularProgressIndicator();
}
