import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/prefs/prefs.dart';
import 'package:platformfriendlyappv2/utils/util.dart';

abstract class ShoppingScreenContract extends StatefulWidget {}

abstract class ShoppingScreenStateContract extends State<ShoppingScreenContract> {
  final screenTitle = "Shopping list";
  final addProductButtonText = 'Add';
  final Color screenBackground = Color.fromRGBO(220, 220, 220, 1.0);

  Widget appBar();
  Widget addProductButton(BuildContext context);
  Widget productListItem(Product product);
  Widget deleteProductButton(Product product);
  Widget listLoader();
  Route<Product> onAddProductRoute();

  Widget scaffoldBody() {
    return Container(
      color: screenBackground,
      child: FutureBuilder(
        future: Prefs.loadProducts(delay: 2),
        builder: (c, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(child: listLoader());
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
          deleteProductButton(product),
        ],
      ),
    );
  }

  void onAddProductClicked(BuildContext context) async {
    final createdProduct = await Navigator.of(context).push(onAddProductRoute());

    if (createdProduct != null) {
      await Prefs.saveProduct(createdProduct);
      setState(() {});
    }
  }
}
