class Coin {
  Coin(this.id,
      {required this.nameAR,
      required this.nameEN,
      required this.icon,
      required this.price});

  final int id;
  final String nameAR;
  final String nameEN;
  final String icon;
  final double price;
}
