import 'package:flutter/cupertino.dart';
import 'package:platformfriendlyappv2/screens/add/add_screen_contract.dart';

class AddProductScreen2 extends AddScreenContract {
  @override
  State<StatefulWidget> createState() => _State2();
}

class _State2 extends AddScreenStateContract {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: appBar(),
      child: scaffoldBody(),
    );
  }

  @override
  Widget addButton(BuildContext context) {
    return CupertinoButton.filled(
      child: Text(addButtonText),
      onPressed: () => okClick(context),
    );
  }

  @override
  Widget appBar() {
    return CupertinoNavigationBar(
      middle: Text(screenTitle),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
    );
  }

  @override
  Widget cancelButton(BuildContext context) {
    return CupertinoButton(
      child: Text(cancelButtonText),
      onPressed: () => cancelClick(context),
    );
  }

  @override
  Widget isPrioritySwitch() {
    return Row(
      children: <Widget>[
        Text(switchLabel),
        Padding(
          padding: standardInsets,
          child: CupertinoSwitch(
            value: switchValue,
            onChanged: (newValue) => setState(() {
                  switchValue = newValue;
                }),
          ),
        ),
      ],
    );
  }

  @override
  Widget nameField() {
    return CupertinoTextField(
      controller: nameController,
      placeholder: nameHint,
    );
  }

  @override
  Widget priceField() {
    return CupertinoTextField(
      controller: priceController,
      placeholder: priceHint,
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget quantityField() {
    return CupertinoTextField(
      controller: quantityController,
      placeholder: quantityHint,
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget vatPercentagePicker() {
    return CupertinoButton(
      child: Text('VAT value: ${vatValueController.text}'),
      onPressed: showPicker,
    );
  }

  void showPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (c) {
        return SizedBox(
          height: 200,
          child: CupertinoPicker(
            itemExtent: 30,
            children: <Widget>[
              Text(vatValues[0]),
              Text(vatValues[1]),
              Text(vatValues[2]),
            ],
            onSelectedItemChanged: (int index) {
              setState(() {
                vatValueController.text = vatValues[index];
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget uselessSlider() {
    return CupertinoSlider(
      value: sliderValue,
      onChanged: (newValue) => setState(
            () {
              sliderValue = newValue;
            },
          ),
    );
  }
}
