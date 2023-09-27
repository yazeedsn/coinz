import 'package:flutter/material.dart';
import 'package:coinz/styles.dart';

class TrendCell extends StatelessWidget {
  const TrendCell({
    super.key,
    required this.trend,
  });

  final double trend;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$trend%',
          style: tableMainEnTextStyle.copyWith(color: const Color(0xFF80CE13)),
        ),
        const SizedBox(width: 6),
        Container(
          height: 6,
          width: 4,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/icons/arrow-up.png'))),
        )
      ],
    );
  }
}
