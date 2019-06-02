import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/screens/add/add_screen_contract.dart';
import 'package:platformfriendlyappv2/widgets/stateful_switch.dart';
import 'package:platformfriendlyappv2/widgets/vat_dropdown.dart';

class AddProductScreen1 extends AddScreenContract {
  @override
  State<StatefulWidget> createState() => _State1();
}

class _State1 extends AddScreenStateContract {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            nameField(),
            quantityField(),
            priceField(),
            vatPercentagePicker(),
            isPrioritySwitch(),
            uselessSlider(),
            ButtonBar(
              children: <Widget>[
                cancelButton(context),
                addButton(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget addButton(BuildContext context) {
    return FlatButton(
      onPressed: () => okClick(context),
      child: Text(addButtonText),
    );
  }

  @override
  Widget appBar() {
    return AppBar(
      title: Text(screenTitle),
    );
  }

  @override
  Widget cancelButton(BuildContext context) {
    return FlatButton(
      onPressed: () => cancelClick(context),
      child: Text(cancelButtonText),
    );
  }

  @override
  Widget nameField() {
    return Padding(
      padding: largerTopInsets,
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(labelText: nameHint),
      ),
    );
  }

  @override
  Widget priceField() {
    return Padding(
      padding: standardInsets,
      child: TextFormField(
        controller: priceController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: priceHint),
      ),
    );
  }

  @override
  Widget quantityField() {
    return Padding(
      padding: standardInsets,
      child: TextFormField(
        controller: quantityController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: quantityHint),
      ),
    );
  }

  @override
  Widget vatPercentagePicker() {
    return Padding(
      padding: standardInsets,
      child: VatDropdown(
        controller: vatValueController,
      ),
    );
  }

  @override
  Widget isPrioritySwitch() {
    return Padding(
      padding: standardInsets,
      child: StatefulSwitch(
        controller: switchController,
      ),
    );
  }

  @override
  Widget uselessSlider() {
    Slider.adaptive(
      value: sliderValue,
      onChanged: (newValue) => print,
    );
  }
}
