import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_button.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_scaffold.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_top_bar.dart';

import 'add_screen_contract.dart';

class AddProductScreen3 extends AddScreenContract {
  @override
  State<StatefulWidget> createState() => _State3();
}

class _State3 extends AddScreenStateContract {
  @override
  Widget addButton(BuildContext context) {
    return AdaptiveButton(
      cupertinoIsFilled: true,
      child: Text(addButtonText),
      onClick: () => okClick(context),
    );
  }

  @override
  Widget appBar() {
    return AdaptiveTopBar(
      title: Text(screenTitle),
      cupertinoBackgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      topBar: appBar(),
      body: scaffoldBody(),
    );
  }

  @override
  Widget cancelButton(BuildContext context) {
    return AdaptiveButton(
      child: Text(cancelButtonText),
      onClick: () => cancelClick(context),
    );
  }

  @override
  Widget isPrioritySwitch() {
    return Padding(
      padding: standardInsets,
      child: SwitchListTile.adaptive(
        value: switchValue,
        onChanged: (newValue) {
          setState(() {
            switchValue = newValue;
          });
        },
        title: Text(switchLabel),
      ),
    );
  }

  @override
  Widget nameField() {
    // TODO: implement nameField
    return null;
  }

  @override
  Widget priceField() {
    // TODO: implement priceField
    return null;
  }

  @override
  Widget quantityField() {
    // TODO: implement quantityField
    return null;
  }

  @override
  Widget uselessSlider() {
    return Slider.adaptive(
      value: sliderValue,
      onChanged: (newValue) => print,
    );
  }

  @override
  Widget vatPercentagePicker() {
    // TODO: implement vatPercentagePicker
    return null;
  }
}
