import 'package:flutter/material.dart';
import 'package:coinz/widgets/outlined_container.dart';
import 'package:coinz/styles.dart';

class AlarmCard extends StatelessWidget {
  const AlarmCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/trash.png',
            width: 12,
            height: 16,
          ),
          const Expanded(child: SizedBox(width: 1)),
          Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Etherium',
                    style: alarmCardEnStyle,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'ايثيريـــوم',
                    style: alarmCardEnStyle,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    '\$',
                    style: alarmCardEnStyle.copyWith(
                      color: const Color(0xFF38AD65),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '10,544.69',
                    style: priceCardStyle.copyWith(
                      color: const Color(0xFF38AD65),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'أقل من',
                    style: alarmCardEnStyle.copyWith(
                      color: const Color(0xFFE72222),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 18),
          Image.asset('assets/icons/eth.png', width: 11, height: 18),
        ],
      ),
    );
  }
}
