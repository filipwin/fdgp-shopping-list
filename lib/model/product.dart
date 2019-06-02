class Product {
  String name;
  int quantity;
  bool isPriority;
  double price;
  double vatValue;

  double getPrice() => num.parse(price.toStringAsFixed(2));
  double getNetPrice() => num.parse(((1 - vatValue) * price).toStringAsFixed(2));

  Product(this.name, this.quantity, this.isPriority, this.price, this.vatValue);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['quantity'],
      json['isPriority'],
      json['price'],
      json['vatValue'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "isPriority": isPriority,
        "price": price,
        "vatValue": vatValue,
      };
}
