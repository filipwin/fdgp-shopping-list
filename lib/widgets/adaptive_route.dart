import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveRoute<T> {
  Route<T> to(Widget target) {
    if (Platform.isIOS)
      return _cupertinoRoute(target);
    else
      return _materialRoute(target);
  }

  Route<T> _cupertinoRoute(Widget target) => CupertinoPageRoute(builder: (c) => target);

  Route<T> _materialRoute(Widget target) => MaterialPageRoute(builder: (c) => target);
}
