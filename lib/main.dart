import 'package:flutter/material.dart';
import 'package:platformfriendlyappv2/screens/list/screen_shopping_list1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ///App Mode:
  ///1 - material only
  ///2 - cupertino only
  ///3 - platform-aware custom
  ///4 - PlatformWidgets lib
  final mode = 1;

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
    switch (mode) {
      case 1:
        return MaterialApp(
          title: title,
          theme: theme,
          home: _pickScreen(mode),
        );
    }
  }

  Widget _pickScreen(int index) {
    switch (index) {
      case 1:
        return ShoppingListScreen1();
      default:
        return ShoppingListScreen1();
    }
  }
}
