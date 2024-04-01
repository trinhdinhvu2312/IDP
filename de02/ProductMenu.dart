import 'dart:io';

import 'Product.dart';

class ProductMenu {
  List<Product> products = [];

  void displayMenu() {
    print("\nMenu:");
    print("1. Add Product");
    print("2. Sort Products by Price");
    print("3. Analyze Products");
    print("4. Find Products with Highest Total Price");
    print("5. Exit");
  }

  void run() {
    String choice;
    do {
      displayMenu();
      stdout.write("Enter your choice: ");
      choice = stdin.readLineSync()!;
      switch (choice) {
        case '1':
          addProduct();
          break;
        case '2':
          sortProductsByPrice();
          break;
        case '3':
          analyzeProducts();
          findProductsWithHighestPrice();
          break;
        case '4':
          findProductsWithHighestTotalPrice();
          break;
        case '5':
          print("Exiting program...");
          break;
        default:
          print("Invalid choice. Please try again.");
          break;
      }
    } while (choice != '5');
  }
  void addProduct(){
    Product newProduct = Product.input();
    products.add(newProduct);
    print("Product added successfully.");
  }
  void sortProductsByPrice(){
    products.sort((a, b) => a.price.compareTo(b.price));
    print("Products sorted by price in ascending order.");
    displayProducts();
  }
  void analyzeProducts() {
    print("Enter a specific price: ");
    int specificPrice = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (specificPrice != -1) {
      int count = 0;
      for (var product in products) {
        if (product.price == specificPrice) {
          count++;
        }
      }
      print("There are $count products with price: $specificPrice");
    } else {
      print("Invalid input for specific price.");
    }
  }
  void findProductsWithHighestTotalPrice() {
    double maxTotalPrice = products.map((product) => product.totalPrice).reduce((a, b) => a > b ? a : b);
    List<Product> maxTotalPriceProducts = products.where((product) => product.totalPrice == maxTotalPrice).toList();
    print("Products with the highest total price:");
    for (var product in maxTotalPriceProducts) {
      displayProductDetails(product);
    }
  }
  void findProductsWithHighestPrice() {
    if (products.isEmpty) {
      print("No products available.");
      return;
    }
    int highestPrice = products.map((product) => product.price).reduce((a, b) => a > b ? a : b);
    List<Product> productsWithHighestPrice = products.where((product) => product.price == highestPrice).toList();
    print("Product with the highest price:");

    for (var product in productsWithHighestPrice) {
      displayProductDetails(product);
    }
  }

  void displayProducts() {
    if (products.isEmpty) {
      print("No products available.");
      return;
    }
    for (var product in products) {
      print("ID: ${product.id}, Name: ${product.name}, Price: ${product.price}, Quantity: ${product.quantity}, Total Price: ${product.totalPrice}");
    }
  }

  void displayProductDetails(Product product) {
    print("ID: ${product.id}, Name: ${product.name}, Price: ${product.price}, Quantity: ${product.quantity}, Total Price: ${product.totalPrice}");
  }
}
