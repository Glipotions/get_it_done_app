import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get_it_done_app/models/item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
    Item(title: 'Peynir Al'),
    Item(title: 'Çöpü At'),
    Item(title: 'Bakkala Git'),
  ];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(
      Item(title: title),
    );
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
