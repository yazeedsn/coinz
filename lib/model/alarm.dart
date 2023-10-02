import 'package:coinz/model/coin.dart';

class Alarm {
  Alarm({required this.coin, required this.value, required this.greater});

  final Coin coin;
  final double value;
  final bool greater;
}
