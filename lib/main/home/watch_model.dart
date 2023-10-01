import 'dart:collection';

import 'package:coinz/main/coin.dart';
import 'package:flutter/material.dart';

class WatchModel extends ChangeNotifier {
  final List<Coin> _watchList = [];

  UnmodifiableListView get items => UnmodifiableListView(_watchList);
  int get length => _watchList.length;
  Coin get(int index) => _watchList[index];

  void add(Coin coin) {
    _watchList.add(coin);
    notifyListeners();
  }

  void remove(int index) {
    _watchList.removeAt(index);
    notifyListeners();
  }
}
