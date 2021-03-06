import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/utils/util.dart';

abstract class AddScreenContract extends StatefulWidget {}

abstract class AddScreenStateContract extends State<AddScreenContract> {
  final vatValues = ['0%', '8%', '23%'];
  final sliderLabel = 'Useless slider';
  final nameHint = 'Name';
  final priceHint = 'Price';
  final quantityHint = 'Quantity';
  final switchLabel = 'Is priority';

  final screenTitle = 'Add product';
  final addButtonText = 'Add';
  final cancelButtonText = 'Cancel';
  double sliderValue = 0.25;
  bool switchValue = false;
  final standardInsets = EdgeInsets.fromLTRB(16, 8, 16, 8);
  final largerTopInsets = EdgeInsets.fromLTRB(16, 16, 16, 8);

  final TextEditingController vatValueController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  Widget appBar();
  Widget nameField();
  Widget quantityField();
  Widget priceField();
  Widget vatPercentagePicker();
  Widget addButton(BuildContext context);
  Widget cancelButton(BuildContext context);
  Widget isPrioritySwitch();
  Widget uselessSlider();

  Widget scaffoldBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(padding: largerTopInsets, child: nameField()),
          Padding(padding: standardInsets, child: quantityField()),
          Padding(padding: standardInsets, child: priceField()),
          Padding(padding: standardInsets, child: vatPercentagePicker()),
          Padding(padding: standardInsets, child: isPrioritySwitch()),
          Padding(padding: standardInsets, child: _slider()),
          Padding(padding: largerTopInsets, child: buttonsSection()),
        ],
      ),
    );
  }

  Widget _slider() {
    return Row(
      children: <Widget>[
        Text(sliderLabel),
        uselessSlider(),
      ],
    );
  }

  void cancelClick(BuildContext context) {
    Navigator.of(context).pop();
  }

  void okClick(BuildContext context) {
    Navigator.of(context).pop(productFromInput());
  }

  Product productFromInput() {
    final name = nameController.text.toString();
    final quantity = num.tryParse(quantityController.text.toString()) ?? 1;
    final isPriority = switchValue;
    final price = num.parse(priceController.text.toString());
    final vatValue = Util.percentageToNum(vatValueController.text.toString());
    return Product(name, quantity, isPriority, price, vatValue);
  }

  Widget buttonsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        cancelButton(context),
        addButton(context),
      ],
    );
  }
}
