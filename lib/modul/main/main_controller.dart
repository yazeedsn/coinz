import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  int _currentIndex = 0;
  int get selected => _currentIndex;
  void setSelected(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
