import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_widget.dart';

class AdaptiveScaffold extends AdaptiveWidget<Scaffold, CupertinoPageScaffold> {
  final Widget body;
  final ObstructingPreferredSizeWidget topBar;
  final Widget materialFab;

  AdaptiveScaffold({
    this.materialFab,
    this.body,
    this.topBar,
  });

  @override
  CupertinoPageScaffold buildCupertinoWidget() {
    return CupertinoPageScaffold(
      child: body,
      navigationBar: topBar,
    );
  }

  @override
  Scaffold buildMaterialWidget() {
    return Scaffold(
      body: body,
      appBar: topBar,
      floatingActionButton: materialFab,
    );
  }
}
