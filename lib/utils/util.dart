import 'dart:convert';

import 'package:platformfriendlyappv2/model/product.dart';

class Util {
  static String numToPercentage(double num) => '${(num * 100).toStringAsFixed(0)}%';
  static double percentageToNum(String percentage) => double.parse(percentage.replaceAll('%', '')) / 100;

  static List<Product> transformProducts(List<String> productJsonList) {
    if (productJsonList != null && productJsonList.isNotEmpty) {
      return productJsonList.map((String it) => Product.fromJson(jsonDecode(it))).toList();
    }

    return <Product>[];
  }
}
