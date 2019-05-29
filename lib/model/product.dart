class Product {
  String name;
  int quantity;
  bool isBought;
  double price;
  double vatValue;

  double getPrice() => num.parse(price.toStringAsFixed(2));
  double getNetPrice() => num.parse(((1 - vatValue) * price).toStringAsFixed(2));

  Product(this.name, this.quantity, this.isBought, this.price, this.vatValue);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['quantity'],
      json['isBought'],
      json['price'],
      json['vatValue'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "isBought": isBought,
        "price": price,
        "vatValue": vatValue,
      };
}
