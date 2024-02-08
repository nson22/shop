import 'package:flutter/material.dart';
import 'package:shop/data/dummy_products.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  bool _showFavoritOnly = false;

  List<Product> get items {
    if (_showFavoritOnly) {
      return _items.where((product) => product.isFavorite).toList();
    }
    return [..._items];
  }

  void showFavoritOnly() {
    _showFavoritOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoritOnly = false;
    notifyListeners();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
