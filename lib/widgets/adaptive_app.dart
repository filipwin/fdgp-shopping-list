import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_widget.dart';

class AdaptiveApp extends AdaptiveWidget<MaterialApp, CupertinoApp> {
  final String title;
  final Widget home;
  final ThemeData materialTheme;
  final CupertinoThemeData cupertinoTheme;

  AdaptiveApp({this.title = 'Shopping list', this.home, this.materialTheme, this.cupertinoTheme});

  @override
  CupertinoApp buildCupertinoWidget() {
    return CupertinoApp(
      title: title,
      theme: cupertinoTheme,
      home: home,
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  MaterialApp buildMaterialWidget() {
    return MaterialApp(
      title: title,
      theme: materialTheme,
      home: home,
      debugShowCheckedModeBanner: false,
    );
  }
}
