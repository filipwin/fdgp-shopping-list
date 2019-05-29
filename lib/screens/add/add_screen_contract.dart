import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/model/product.dart';

abstract class AddScreenContract extends StatefulWidget {}

abstract class AddScreenStateContract extends State<AddScreenContract> {
  Widget appBar();
  Widget nameField();
  Widget quantityField();
  Widget priceField();
  Widget vatPercentagePicker();
  Widget addButton(BuildContext context);
  Widget cancelButton(BuildContext context);
  Widget isBoughtSwitch();
  void okClick(BuildContext context);
  void cancelClick(BuildContext context);
  Product productFromInput();
}
