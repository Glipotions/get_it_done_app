import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it_done_app/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
    // Item(title: 'Peynir Al'),
    // Item(title: 'Çöpü At'),
    // Item(title: 'Bakkala Git'),
  ];

  static SharedPreferences _sharedPref = SharedPreferences as SharedPreferences;
  List<String> _itemAsString = [];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(title: title));
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemsToSharedPref(List<Item> items) {
    _items.clear();

    for (var item in items) {
      _itemAsString.add(json.encode(item.toMap()));
    }

    _sharedPref.setStringList('toDoData', _itemAsString);
  }

  void loadItemsFromSharedPref() {
    List<String>? tempList = _sharedPref.getStringList('toDoData') ?? [];
    for (var item in tempList) {
      _items.add(Item.fromMap(jsonDecode(item)));
    }
  }
}
