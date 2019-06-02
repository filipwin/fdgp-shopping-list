import 'package:flutter/material.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/prefs/prefs.dart';
import 'package:platformfriendlyappv2/screens/add/screen_add_product1.dart';
import 'package:platformfriendlyappv2/screens/list/shopping_screen_contract.dart';
import 'package:platformfriendlyappv2/utils/util.dart';

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
  Widget scaffoldBody() {
    return Container(
      color: Color.fromRGBO(220, 220, 220, 1.0),
      child: FutureBuilder(
        future: Prefs.loadProducts(delay: 2),
        builder: (c, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(child: CircularProgressIndicator());
          else {
            if (snapshot.hasData && !snapshot.hasError)
              return productList(Util.transformProducts(snapshot.data));
            else
              return Container();
          }
        },
      ),
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
  Widget productListItemContent(Product product) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${product.name} x ${product.quantity}',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
              Text(product.price.toStringAsFixed(2)),
            ],
          ),
          GestureDetector(
            child: Icon(
              Icons.clear,
              size: 36,
              color: Colors.red,
            ),
            onTap: () => onDeleteProduct(product),
          ),
        ],
      ),
    );
  }

  @override
  Widget addProductButton(BuildContext context) {
    return FloatingActionButton(
      child: Text('Add'),
      onPressed: () => onAddProductClicked(context),
    );
  }

  @override
  void onAddProductClicked(BuildContext context) async {
    final createdProduct = await Navigator.of(context).push(
      MaterialPageRoute<Product>(
        builder: (c) => AddProductScreen1(),
      ),
    );

    if (createdProduct != null) {
      await Prefs.saveProduct(createdProduct);
      setState(() {});
    }
  }
}
