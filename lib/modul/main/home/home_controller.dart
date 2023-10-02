import 'dart:collection';

import 'package:coinz/model/coin.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final List<Coin> _watchList = [];
  final List<bool> _isFront = [];

  UnmodifiableListView get items => UnmodifiableListView(_watchList);
  int get length => _watchList.length;
  Coin get(int index) => _watchList[index];

  bool isFront(int index) => _isFront[index];
  void flip(int index) {
    _isFront[index] = !_isFront[index];
    notifyListeners();
  }

  void add(Coin coin) {
    _watchList.add(coin);
    _isFront.add(true);
    notifyListeners();
  }

  void remove(int index) {
    _watchList.removeAt(index);
    _isFront.removeAt(index);
    notifyListeners();
  }
}
