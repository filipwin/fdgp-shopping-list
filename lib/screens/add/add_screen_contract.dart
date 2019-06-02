import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/controllers/switch_controller.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/utils/util.dart';

abstract class AddScreenContract extends StatefulWidget {}

abstract class AddScreenStateContract extends State<AddScreenContract> {
  final sliderLabel = 'Useless slider';
  final nameHint = 'Name';
  final priceHint = 'Price';
  final quantityHint = 'Quantity';

  final screenTitle = 'Add product';
  final addButtonText = 'Add';
  final cancelButtonText = 'Cancel';
  double sliderValue = 0.25;
  final standardInsets = EdgeInsets.fromLTRB(16, 8, 16, 8);
  final largerTopInsets = EdgeInsets.fromLTRB(16, 16, 16, 8);

  final TextEditingController vatValueController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final SwitchController switchController = SwitchController();

  Widget appBar();
  Widget nameField();
  Widget quantityField();
  Widget priceField();
  Widget vatPercentagePicker();
  Widget addButton(BuildContext context);
  Widget cancelButton(BuildContext context);
  Widget isPrioritySwitch();
  Widget uselessSlider();

  void cancelClick(BuildContext context) {
    Navigator.of(context).pop();
  }

  void okClick(BuildContext context) {
    Navigator.of(context).pop(productFromInput());
  }

  Product productFromInput() {
    final name = nameController.text.toString();
    final quantity = num.tryParse(quantityController.text.toString()) ?? 1;
    final isPriority = switchController.value;
    final price = num.parse(priceController.text.toString());
    final vatValue = Util.percentageToNum(vatValueController.text.toString());
    return Product(name, quantity, isPriority, price, vatValue);
  }
}
