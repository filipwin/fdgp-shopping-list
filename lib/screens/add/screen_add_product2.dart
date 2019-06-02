import 'package:flutter/cupertino.dart';
import 'package:platformfriendlyappv2/screens/add/add_screen_contract.dart';

class AddProductScreen2 extends AddScreenContract {
  @override
  State<StatefulWidget> createState() => _State2();
}

class _State2 extends AddScreenStateContract {
  bool _switchValue = false;

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
  Widget buttonsSection() {
    return Padding(
      padding: largerTopInsets,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          cancelButton(context),
          addButton(context),
        ],
      ),
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
    return Padding(
      padding: standardInsets,
      child: Row(
        children: <Widget>[
          Text(switchLabel),
          Padding(
            padding: standardInsets,
            child: CupertinoSwitch(
              value: _switchValue,
              onChanged: (newValue) => setState(() {
                    _switchValue = newValue;
                  }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget nameField() {
    return Padding(
      padding: largerTopInsets,
      child: CupertinoTextField(
        controller: nameController,
        placeholder: nameHint,
      ),
    );
  }

  @override
  Widget priceField() {
    return Padding(
      padding: standardInsets,
      child: CupertinoTextField(
        controller: priceController,
        placeholder: priceHint,
        keyboardType: TextInputType.number,
      ),
    );
  }

  @override
  Widget quantityField() {
    return Padding(
      padding: standardInsets,
      child: CupertinoTextField(
        controller: quantityController,
        placeholder: quantityHint,
        keyboardType: TextInputType.number,
      ),
    );
  }

  @override
  Widget vatPercentagePicker() {
    return Padding(
      padding: standardInsets,
      child: CupertinoButton(
        child: Text('VAT value: ${vatValueController.text}'),
        onPressed: showPicker,
      ),
    );
  }

  void showPicker() {
    final values = ['0%', '8%', '23%'];
    showCupertinoModalPopup(
      context: context,
      builder: (c) {
        return SizedBox(
          height: 200,
          child: CupertinoPicker(
            itemExtent: 30,
            children: <Widget>[
              Text(values[0]),
              Text(values[1]),
              Text(values[2]),
            ],
            onSelectedItemChanged: (int index) {
              setState(() {
                vatValueController.text = values[index];
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget uselessSlider() {
    return Padding(
      padding: standardInsets,
      child: Row(
        children: <Widget>[
          Text(sliderLabel),
          CupertinoSlider(
            value: sliderValue,
            onChanged: (newValue) => setState(
                  () {
                    sliderValue = newValue;
                  },
                ),
          ),
        ],
      ),
    );
  }
}
