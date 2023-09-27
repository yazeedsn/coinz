import 'package:flutter/material.dart';

import 'package:coinz/widgets/coin_card.dart';
import 'package:coinz/widgets/coin_table_row.dart';
import 'package:coinz/widgets/coin_cell.dart';
import 'package:coinz/widgets/price_cell.dart';
import 'package:coinz/widgets/trend_cell.dart';
import 'package:coinz/styles.dart';

class PriceScreen extends StatelessWidget {
  const PriceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 30, 26, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'أسعار العملات الإلكترونية',
                  textAlign: TextAlign.end,
                  style: headingStyle,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '09-27-2023',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color(0xFF95989C),
                        fontSize: 12,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      ' :آخر تحديث',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color(0xFF95989C),
                        fontSize: 12,
                        fontFamily: 'Swissra',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 9,
                    children: const [
                      CoinCard(
                        nameEN: 'Bitcoin',
                        nameAR: 'بيتكوين',
                        price: '\$ 10,544.69',
                        image: 'assets/icons/btc.png',
                      ),
                      CoinCard(
                        nameEN: 'Bitcoin',
                        nameAR: 'بيتكوين',
                        price: '\$ 10,544.69',
                        image: 'assets/icons/btc.png',
                      ),
                      CoinCard(
                        nameEN: 'Bitcoin',
                        nameAR: 'بيتكوين',
                        price: '\$ 10,544.69',
                        image: 'assets/icons/btc.png',
                      ),
                      CoinCard(
                        nameEN: 'Bitcoin',
                        nameAR: 'بيتكوين',
                        price: '\$ 10,544.69',
                        image: 'assets/icons/btc.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return const CoinTableRow(
                      height: 42,
                      padding: EdgeInsets.symmetric(horizontal: 26),
                      backgroundColor: Color(0xFFF8F9FB),
                      children: [
                        Text(
                          'التداول',
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'السعر',
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          'العملة',
                          textAlign: TextAlign.end,
                        ),
                      ],
                    );
                  } else {
                    return CoinTableRow(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      children: [
                        const TrendCell(trend: 8.19),
                        const PriceCell(price: 10544.69),
                        CoinCell(
                          index: index,
                          nameEN: 'Bitcoin',
                          nameAR: 'بيتكوين',
                          icon: 'assets/icons/btc2.png',
                        ),
                      ],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
