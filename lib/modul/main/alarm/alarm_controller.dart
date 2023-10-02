import 'dart:collection';

import 'package:coinz/model/alarm.dart';
import 'package:flutter/material.dart';

class AlarmController extends ChangeNotifier {
  AlarmController() {
    controller.text = "\$100000";
  }

  final List<Alarm> _alarms = [];
  final TextEditingController controller = TextEditingController();

  int _selectedCoinId = 0;
  bool _greater = true;

  UnmodifiableListView<Alarm> get alarms => UnmodifiableListView(_alarms);
  int get length => _alarms.length;
  Alarm get(int index) => _alarms[index];

  int get selected => _selectedCoinId;
  bool get greater => _greater;
  String get text => controller.text;

  void add(Alarm alarm) {
    _alarms.add(alarm);
    notifyListeners();
  }

  void remove(int index) {
    _alarms.removeAt(index);
    notifyListeners();
  }

  void flipGreater() => _greater = !_greater;
  void setCoin(int id) => _selectedCoinId = id;
}
