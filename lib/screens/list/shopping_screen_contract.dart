import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/prefs/prefs.dart';

abstract class ShoppingScreenContract extends StatefulWidget {}

abstract class ShoppingScreenStateContract extends State<ShoppingScreenContract> {
  final screenTitle = "Shopping list";

  Widget appBar();
  Widget scaffoldBody();
  Widget addProductButton(BuildContext context);
  Widget productListItem(Product product);
  Widget productListItemContent(Product product);
  void onAddProductClicked(BuildContext context);

  void onDeleteProduct(Product product) {
    Prefs.deleteProduct(product.name).then((result) {
      setState(() {});
    });
  }

  Widget productList(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (c, index) => productListItem(products[index]),
      ),
    );
  }
}
