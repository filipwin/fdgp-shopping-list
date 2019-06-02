import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platformfriendlyappv2/screens/list/screen_shopping_list1.dart';
import 'package:platformfriendlyappv2/screens/list/screen_shopping_list2.dart';

import 'screens/list/screen_shopping_list3.dart';
import 'widgets/adaptive_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ///App Mode:
  ///1 - material only
  ///2 - cupertino only
  ///3 - platform-aware custom
  ///4 - PlatformWidgets lib
  final mode = 3;

  @override
  Widget build(BuildContext context) {
    return _pickApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  Widget _pickApp({String title, ThemeData theme}) {
    final cupertinoTheme = CupertinoThemeData(primaryColor: theme.primaryColor);

    switch (mode) {
      case 1:
        return MaterialApp(
          title: title,
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: _pickScreen(mode),
        );
      case 2:
        return CupertinoApp(
          title: title,
          theme: cupertinoTheme,
          debugShowCheckedModeBanner: false,
          home: _pickScreen(mode),
        );
      case 3:
        return AdaptiveApp(
          title: title,
          materialTheme: theme,
          cupertinoTheme: cupertinoTheme,
          home: _pickScreen(mode),
        );
    }
  }

  Widget _pickScreen(int index) {
    switch (index) {
      case 1:
        return ShoppingListScreen1();
      case 2:
        return ShoppingListScreen2();
      case 3:
        return ShoppingListScreen3();
    }
  }
}
