import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/screens/add/screen_add_product3.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_fab.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_icon_button.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_list_item.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_loader.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_navbar_action.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_route.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_scaffold.dart';
import 'package:platformfriendlyappv2/widgets/adaptive_top_bar.dart';

import 'shopping_screen_contract.dart';

///Platform-friendly approach utilising Platform.isX check to adapt it's Widgets.
///It may use Contract interface, but not have to.
///Sometimes it creates conflicts (e.g. single addProduct method,
///which in this case should produce 2 totally different widgets in different places.
class ShoppingListScreen3 extends ShoppingScreenContract {
  @override
  State<StatefulWidget> createState() => _State3();
}

class _State3 extends ShoppingScreenStateContract {
  @override
  //It's a conflict here - it needs to be separated to 2 different platform-specific building methods.
  Widget addProductButton(BuildContext context) {
    return AdaptiveFab(
      materialChild: Text(addProductButtonText),
      materialOnPressed: () => onAddProductClicked(context),
    );
  }

  Widget cupertinoAddProductButton(BuildContext context) {
    return AdaptiveNavBarAction(
      cupertinoIcon: CupertinoIcons.add,
      cupertinoIconColor: CupertinoColors.activeBlue,
      cupertinoOnClick: () => onAddProductClicked(context),
    );
  }

  @override
  Widget appBar() {
    return AdaptiveTopBar(
      title: Text(screenTitle),
      cupertinoRightAction: cupertinoAddProductButton(context),
      cupertinoBackgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: scaffoldBody(),
      topBar: appBar(),
      materialFab: addProductButton(context),
    );
  }

  @override
  Route<Product> onAddProductRoute() {
    return AdaptiveRoute().to(AddProductScreen3());
  }

  @override
  Widget productListItem(Product product) {
    return AdaptiveListItem(
      cellColor: Color.fromRGBO(255, 255, 255, 1.0),
      materialShadow: BoxShadow(
        offset: Offset(2, 2),
        blurRadius: 5.0,
        color: Color.fromRGBO(100, 100, 100, 0.2),
      ),
      materialBorderRadius: BorderRadius.circular(5.0),
      content: productListItemContent(product),
    );
  }

  @override
  Widget deleteProductButton(Product product) {
    return AdaptiveIconButton(
      materialIcon: Icons.clear,
      materialColor: Colors.red,
      cupertinoIcon: CupertinoIcons.clear,
      cupertinoColor: CupertinoColors.destructiveRed,
    );
  }

  @override
  Widget listLoader() => AdaptiveLoader();
}
