import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_widget.dart';

// ignore: must_be_immutable
class AdaptiveTextField extends AdaptiveWidget<TextFormField, CupertinoTextField> {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String hintText;
  InputDecoration _materialDecoration;

  AdaptiveTextField({this.controller, this.hintText, this.keyboardType = TextInputType.text}) {
    _materialDecoration = InputDecoration(
      labelText: hintText,
    );
  }

  @override
  CupertinoTextField buildCupertinoWidget() {
    return CupertinoTextField(
      keyboardType: keyboardType,
      controller: controller,
      placeholder: hintText,
    );
  }

  @override
  TextFormField buildMaterialWidget() {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: _materialDecoration,
    );
  }
}
