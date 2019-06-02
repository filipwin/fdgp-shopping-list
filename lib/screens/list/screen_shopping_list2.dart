import 'package:flutter/cupertino.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/prefs/prefs.dart';
import 'package:platformfriendlyappv2/screens/add/screen_add_product2.dart';
import 'package:platformfriendlyappv2/screens/list/shopping_screen_contract.dart';
import 'package:platformfriendlyappv2/utils/util.dart';

///No platform-friendly approach. Just clean Cupertino layout.
class ShoppingListScreen2 extends ShoppingScreenContract {
  @override
  State<StatefulWidget> createState() => _State2();
}

class _State2 extends ShoppingScreenStateContract {
  @override
  Widget appBar() {
    return CupertinoNavigationBar(
      middle: Text(screenTitle),
      trailing: addProductButton(context),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: appBar(),
      child: scaffoldBody(),
    );
  }

  @override
  Widget addProductButton(BuildContext context) {
    return GestureDetector(
      onTap: () => onAddProductClicked(context),
      child: Icon(
        CupertinoIcons.add,
        color: CupertinoColors.activeBlue,
      ),
    );
  }

  @override
  void onAddProductClicked(BuildContext context) async {
    final createdProduct = await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (c) => AddProductScreen2(),
      ),
    );

    if (createdProduct != null) {
      await Prefs.saveProduct(createdProduct);
      setState(() {});
    }
  }

  @override
  Widget productListItem(Product product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
      child: Container(
        color: CupertinoColors.white,
        child: productListItemContent(product),
      ),
    );
  }

  @override
  Widget productListItemContent(Product product) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
              CupertinoIcons.clear,
              size: 36,
              color: CupertinoColors.destructiveRed,
            ),
            onTap: () => onDeleteProduct(product),
          ),
        ],
      ),
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
              return Center(child: CupertinoActivityIndicator());
            else {
              if (snapshot.hasData && !snapshot.hasError)
                return productList(Util.transformProducts(snapshot.data));
              else
                return Container();
            }
          },
        ));
  }
}
