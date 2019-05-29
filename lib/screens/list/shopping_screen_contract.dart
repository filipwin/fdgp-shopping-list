import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/model/product.dart';

abstract class ShoppingScreenContract extends StatefulWidget {}

abstract class ShoppingScreenStateContract extends State<ShoppingScreenContract> {
  Widget appBar();
  Widget scaffoldBody();
  Widget fab(BuildContext context);
  Widget productList(List<Product> products);
  Widget productListItem(Product product);
  Widget productListItemContent(Product product);
  void onFabPressed(BuildContext context);
  void onDeleteProduct(Product product);
}
