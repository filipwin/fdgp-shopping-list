import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/controllers/switch_controller.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/screens/add/add_screen_contract.dart';
import 'package:platformfriendlyappv2/utils/util.dart';
import 'package:platformfriendlyappv2/widgets/stateful_switch.dart';
import 'package:platformfriendlyappv2/widgets/vat_dropdown.dart';

class AddProductScreen1 extends AddScreenContract {
  @override
  State<StatefulWidget> createState() => _State1();
}

class _State1 extends AddScreenStateContract {
  final TextEditingController _vatValueController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final SwitchController _switchController = SwitchController();

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
            isBoughtSwitch(),
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
      child: Text('Add'),
    );
  }

  @override
  Widget appBar() {
    return AppBar(
      title: Text('Add product'),
    );
  }

  @override
  Widget cancelButton(BuildContext context) {
    return FlatButton(
      onPressed: () => cancelClick(context),
      child: Text('Cancel'),
    );
  }

  @override
  Widget nameField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(labelText: 'Name'),
      ),
    );
  }

  @override
  Widget priceField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextFormField(
        controller: _priceController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Price'),
      ),
    );
  }

  @override
  Widget quantityField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextFormField(
        controller: _quantityController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Quantity'),
      ),
    );
  }

  @override
  Widget vatPercentagePicker() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: VatDropdown(
        controller: _vatValueController,
      ),
    );
  }

  @override
  Widget isBoughtSwitch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: StatefulSwitch(
        controller: _switchController,
      ),
    );
  }

  @override
  void cancelClick(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void okClick(BuildContext context) {
    Navigator.of(context).pop(productFromInput());
  }

  @override
  Product productFromInput() {
    final name = _nameController.text.toString();
    final quantity = num.tryParse(_quantityController.text.toString()) ?? 1;
    final isBought = _switchController.value;
    final price = num.parse(_priceController.text.toString());
    final vatValue = Util.percentageToNum(_vatValueController.text.toString());
    return Product(name, quantity, isBought, price, vatValue);
  }
}
