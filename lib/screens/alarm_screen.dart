import 'package:flutter/material.dart';

import 'package:coinz/widgets/dropdownbutton.dart';
import 'package:coinz/widgets/dropdownitem.dart';
import 'package:coinz/widgets/alarm_card.dart';
import 'package:coinz/widgets/outlined_container.dart';
import 'package:coinz/styles.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, top: 38),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'منبه العملات',
                  style: headingStyle,
                ),
                const SizedBox(height: 5),
                const Text(
                  'يرجى اختيار نوع العملة',
                  style: secondaryStyle,
                ),
                const SizedBox(height: 9),
                const OutlinedContainer(
                  padding: EdgeInsets.only(right: 16),
                  child: DropDownButton(
                    items: [
                      DropDownItem(
                          nameAR: 'بيتكوين',
                          nameEN: 'Bitcoin',
                          icon: 'assets/icons/btc2.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'يرجى تحديد قيمة المنبه',
                  style: secondaryStyle,
                ),
                const SizedBox(height: 9),
                const SizedBox(height: 20),
                Container(
                  height: 55,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFDB00),
                        Color(0xFFFFA500),
                      ],
                    ),
                  ),
                  child: const Text(
                    'اضـــافة تنبيه',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Swossra',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          const Divider(color: Color(0xFFF8F9FB)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                AlarmCard(),
                SizedBox(height: 18),
                AlarmCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
