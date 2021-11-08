import 'package:flutter/material.dart';
import 'package:get_it_done_app/models/item.dart';

class ItemData with ChangeNotifier {
  final List<Item> items = [
    Item(title: 'Peynir Al'),
    Item(title: 'Çöpü At'),
    Item(title: 'Bakkala Git'),
  ];

  void toggleStatus(int index) {
    items[index].toggleStatus();
    notifyListeners();
  }

  void addItem(String title) {
    items.add(
      Item(title: title),
    );
    notifyListeners();
  }

  void deleteItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
