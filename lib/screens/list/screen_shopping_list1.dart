import 'package:flutter/material.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/screens/add/screen_add_product1.dart';
import 'package:platformfriendlyappv2/screens/list/shopping_screen_contract.dart';

///No platform-friendly approach. Just clean Material layout.
class ShoppingListScreen1 extends ShoppingScreenContract {
  @override
  State<StatefulWidget> createState() => _State1();
}

class _State1 extends ShoppingScreenStateContract {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: scaffoldBody(),
      floatingActionButton: addProductButton(context),
    );
  }

  @override
  Widget appBar() {
    return AppBar(
      title: Text(screenTitle),
    );
  }

  @override
  Widget productListItem(Product product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 5.0,
              color: Color.fromRGBO(100, 100, 100, 0.2),
            ),
          ],
        ),
        child: productListItemContent(product),
      ),
    );
  }

  @override
  Widget deleteProductButton(Product product) {
    return GestureDetector(
      child: Icon(
        Icons.clear,
        size: 36,
        color: Colors.red,
      ),
      onTap: () => onDeleteProduct(product),
    );
  }

  @override
  Widget addProductButton(BuildContext context) {
    return FloatingActionButton(
      child: Text(addProductButtonText),
      onPressed: () => onAddProductClicked(context),
    );
  }

  @override
  Route<Product> onAddProductRoute() => MaterialPageRoute(builder: (c) => AddProductScreen1());

  @override
  Widget listLoader() => CircularProgressIndicator();
}
