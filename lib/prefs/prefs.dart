import 'dart:convert';

import 'package:platformfriendlyappv2/model/product.dart';
import 'package:platformfriendlyappv2/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<List<String>> loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final products = prefs.getStringList(_key);
    return products;
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
