import 'dart:collection';

import 'package:coinz/main/alarm/alarm.dart';
import 'package:flutter/material.dart';

class AlarmModel extends ChangeNotifier {
  final List<Alarm> _alarms = [];

  UnmodifiableListView<Alarm> get alarms => UnmodifiableListView(_alarms);
  int get length => _alarms.length;
  Alarm get(int index) => _alarms[index];

  void add(Alarm alarm) {
    _alarms.add(alarm);
    notifyListeners();
  }

  void remove(int index) {
    _alarms.removeAt(index);
    notifyListeners();
  }
}
