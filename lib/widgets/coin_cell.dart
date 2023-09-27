import 'package:flutter/material.dart';
import 'package:coinz/styles.dart';

class CoinCell extends StatelessWidget {
  const CoinCell({
    super.key,
    required this.index,
    required this.icon,
    required this.nameEN,
    required this.nameAR,
  });

  final int index;
  final String icon;
  final String nameEN;
  final String nameAR;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          nameEN,
          style: tableMainEnTextStyle,
        ),
        const SizedBox(width: 8),
        Text(
          nameAR,
          style: tableMainArTextStyle,
        ),
        const SizedBox(width: 14),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage(icon))),
        ),
        const SizedBox(width: 14),
        Text(
          index.toString(),
          style: tableSecondaryTextStyle,
        ),
      ],
    );
  }
}
