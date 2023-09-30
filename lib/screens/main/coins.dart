List<Coin> coins = [
  Coin(
    0,
    nameAR: 'بيتكوين',
    nameEN: 'Bitcoin',
    icon: 'assets/icons/btc2.png',
    price: 10544.69,
  ),
  Coin(
    1,
    nameAR: 'ايثيريوم',
    nameEN: 'Ethereum',
    icon: 'assets/icons/eth.png',
    price: 10544.69,
  ),
  Coin(
    2,
    nameAR: 'ريبـل',
    nameEN: 'Ripple',
    icon: 'assets/icons/ripple.png',
    price: 10544.69,
  ),
];

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
