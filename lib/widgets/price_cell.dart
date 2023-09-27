import 'package:flutter/material.dart';
import 'package:coinz/styles.dart';

class PriceCell extends StatelessWidget {
  const PriceCell({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '\$',
          style: tableSecondaryTextStyle.copyWith(fontSize: 11),
        ),
        const SizedBox(width: 8),
        Text(
          price.toString(),
          style: tableMainEnTextStyle,
        ),
      ],
    );
  }
}
