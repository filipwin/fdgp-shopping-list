import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_button.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_scaffold.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_slider.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_switch_tile.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_text_field.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_top_bar.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_vat_dropdown.dart';

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
    return AdaptiveSwitchTile(
      switchLabel: switchLabel,
      value: switchValue,
      onChanged: (newValue) {
        setState(() {
          switchValue = newValue;
        });
      },
    );
  }

  @override
  Widget nameField() {
    return AdaptiveTextField(
      controller: nameController,
      hintText: nameHint,
    );
  }

  @override
  Widget priceField() {
    return AdaptiveTextField(
      controller: priceController,
      hintText: priceHint,
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget quantityField() {
    return AdaptiveTextField(
      controller: quantityController,
      hintText: quantityHint,
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget uselessSlider() {
    return AdaptiveSlider(
      value: sliderValue,
      onChanged: (newValue) {
        setState(() {
          sliderValue = newValue;
        });
      },
    );
  }

  @override
  Widget vatPercentagePicker() {
    return AdaptiveVatDropdown(
      materialValueController: vatValueController,
      cupertinoContext: context,
      cupertinoSpinnerHeight: 200,
      cupertinoSpinnerItems: <Widget>[
        Text(vatValues[0]),
        Text(vatValues[1]),
        Text(vatValues[2]),
      ],
      onItemSelected: (int index) {
        setState(() {
          vatValueController.text = vatValues[index];
        });
      },
    );
  }
}
