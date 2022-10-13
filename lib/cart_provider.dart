import 'package:flutter/material.dart';

class CartProvider extends  ChangeNotifier {

  List<String> items = [];


  void addItem(String item) {
    items.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }

}