import 'package:coinz/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:coinz/main/coin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedCoinCard extends StatefulWidget {
  const AnimatedCoinCard({
    super.key,
    this.onBackTap,
    required this.coin,
  });
  final Coin coin;
  final Function? onBackTap;

  @override
  State<AnimatedCoinCard> createState() => _AnimatedCoinCardState();
}

class _AnimatedCoinCardState extends State<AnimatedCoinCard> {
  bool _showFront = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_showFront) {
          widget.onBackTap!();
        }
      },
      onLongPress: () {
        setState(() {
          _showFront = !_showFront;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child:
            (_showFront) ? _cardFrontBuilder(widget.coin) : _cardBackBuilder(),
      ),
    );
  }

  Container _cardFrontBuilder(Coin coin) {
    return Container(
      height: 96.h,
      width: 155.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
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
          Image.asset(
            coin.icon,
            width: 30.w,
            height: 30.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                coin.nameAR,
                style: alarmCardArStyle.copyWith(color: Colors.white),
              ),
              SizedBox(width: 8.w),
              Text(
                coin.nameEN,
                style: alarmCardEnStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
          Text(
            '\$${coin.price}',
            style: priceCardStyle,
          ),
        ],
      ),
    );
  }

  Container _cardBackBuilder() {
    return Container(
      height: 96.h,
      width: 155.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: const Text('إزالة'),
    );
  }
}
