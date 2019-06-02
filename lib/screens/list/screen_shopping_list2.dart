import 'package:flutter/cupertino.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/screens/add/screen_add_product2.dart';
import 'package:platformfriendlyappv2/screens/list/shopping_screen_contract.dart';

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
  Route<Product> onAddProductRoute() => CupertinoPageRoute(builder: (c) => AddProductScreen2());

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
  Widget deleteProductButton(Product product) {
    return GestureDetector(
      child: Icon(
        CupertinoIcons.clear,
        size: 36,
        color: CupertinoColors.destructiveRed,
      ),
      onTap: () => onDeleteProduct(product),
    );
  }

  @override
  Widget listLoader() => CupertinoActivityIndicator();
}
