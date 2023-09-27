import 'package:flutter/material.dart';
import 'package:coinz/styles.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    super.key,
    required this.nameEN,
    required this.nameAR,
    required this.price,
    required this.image,
  });

  final String nameEN;
  final String nameAR;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 155,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFDB00),
            Color(0xFFFFA500),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nameEN,
                style: alarmCardEnStyle.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                nameAR,
                style: alarmCardArStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
          Text(
            price,
            style: priceCardStyle,
          ),
        ],
      ),
    );
  }
}
