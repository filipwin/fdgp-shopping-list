import 'dart:convert';

import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Ugly as hell class handling product persistence.
///Should be non-static and probably injected.
class Prefs {
  static final _key = "products";

  static Future<void> saveProduct(Product product) async {
    final products = Util.transformProducts(await loadProducts() ?? <String>[]);
    products.add(product);
    saveProducts(products);
  }

  static Future<void> saveProducts(List<Product> products) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_key, products.map((it) => jsonEncode(it.toJson())).toList());
  }

  ///Load products. Artificial delay can be added to give loader a chance to appear.
  static Future<List<String>> loadProducts({int delay = 0}) async {
    final prefs = await SharedPreferences.getInstance();
    final products = prefs.getStringList(_key);
    return Future.delayed(Duration(seconds: delay), () => products);
  }

  static Future<void> deleteProduct(String name) async {
    final products = Util.transformProducts(await loadProducts() ?? <String>[]);
    products.removeWhere((item) => item.name == name);
    saveProducts(products);
  }

  static Future<void> clearProducts() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
