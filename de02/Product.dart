import 'dart:io';

class Product {
  int id;
  String name;
  int price;
  double quantity;

  double get totalPrice => price*quantity;

  Product({
      required this.id,
      required this.name,
      required this.price,
      required this.quantity
  }) :  assert(name.length >= 2 && name.length <= 200, 'Name must be between 2 and 200 characters'),
        assert(price >= 0 && price <= 1000, 'Price must be between 0 and 1000'),
        assert(quantity > 0, 'Quantity must be greater than 0');

  factory Product.input() {
    int? _id;
    while (_id == null) {
      print("Enter ID (must be an integer): ");
      final inputId = stdin.readLineSync() ?? '';

      try {
        _id = int.parse(inputId);
      } on FormatException catch (e) {
        print("Invalid ID. Please enter a valid integer.");
      }
    }

    print("Enter name product: ");
    String _name = stdin.readLineSync() ?? '';

    print("Enter price: ");
    int _price = int.parse(stdin.readLineSync() ?? '');

    print("Enter quantity: ");
    double _quantity = double.parse(stdin.readLineSync() ?? '');

    return Product(
        id: _id,
        name: _name,
        price: _price,
        quantity: _quantity);
  }

  @override
  String toString() {
    return 'id: $id, name: $name, price: $price, quantity: $quantity, total_price: $totalPrice' ;
  }
}
