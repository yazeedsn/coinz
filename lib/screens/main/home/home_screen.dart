import 'dart:math';

import 'package:coinz/screens/main/coins.dart';
import 'package:coinz/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:coinz/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Coin> watchList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(26.w, 30.h, 26.w, 17.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'أسعار العملات الإلكترونية',
                    textAlign: TextAlign.start,
                    style: headingStyle,
                  ),
                  _lastUpdateBuilder(),
                  SizedBox(height: 14.h),
                  _gridBuilder(watchList),
                ],
              ),
            ),
            _listBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _lastUpdateBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          ' :آخر تحديث',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: highlightTextColor,
            fontSize: 12.sp,
            fontFamily: 'Swissra',
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          '09-27-2023',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: highlightTextColor,
            fontSize: 12.sp,
            fontFamily: 'SF-Pro-Display',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  SizedBox _gridBuilder(List<Coin> watchList) {
    return SizedBox(
      height: 220.h,
      width: double.infinity,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        crossAxisCount: 2,
        childAspectRatio: 1.6,
        mainAxisSpacing: 9,
        crossAxisSpacing: 9,
        children: <Widget>[
              for (Coin coin in watchList) AnimatedCoinCard(coin: coin)
            ] +
            [
              _addButtonBuilder(() {
                setState(() {
                  watchList.add(coins.first);
                });
              }),
            ],
      ),
    );
  }

  InkWell _addButtonBuilder(void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 96.h,
        width: 155.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9FA),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 26.r,
              height: 26.r,
              decoration: BoxDecoration(
                color: const Color(0xFF000000).withOpacity(0.18),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'إضغط للاضافة',
              style: alarmCardArStyle.copyWith(
                color: const Color(0xFF000000).withOpacity(0.18),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView _listBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: coins.length + 1, // one item is for the header
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _tableHeaderBuilder();
          } else {
            return _tableRowBuilder(index);
          }
        });
  }

  Widget _tableHeaderBuilder() {
    return _rowBuilder(
      height: 42.h,
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      backgroundColor: const Color(0xFFF8F9FB),
      children: const [
        Text(
          'العملة',
          textAlign: TextAlign.center,
        ),
        Text(
          'السعر',
          textAlign: TextAlign.center,
        ),
        Text(
          'التداول',
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  Widget _tableRowBuilder(int index) {
    return _rowBuilder(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      children: [
        _coinCellBuilder(coin: coins[index - 1]),
        _priceCellBuilder(price: 10544.69),
        _trendCellBuilder(trend: 8.19),
      ],
    );
  }

  Container _rowBuilder({
    double? height,
    EdgeInsets? padding,
    Color? backgroundColor,
    required List<Widget> children,
  }) {
    assert(children.length == 3);

    return Container(
      height: height,
      padding: padding,
      color: backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: children[0]),
          Expanded(flex: 1, child: children[1]),
          Expanded(flex: 1, child: children[2]),
        ],
      ),
    );
  }

  Row _coinCellBuilder({required Coin coin}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${coin.id + 1}',
          style: tableSecondaryTextStyle,
        ),
        SizedBox(width: 14.w),
        Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage(coin.icon))),
        ),
        SizedBox(width: 14.w),
        Text(
          coin.nameAR,
          style: tableMainArTextStyle,
        ),
        SizedBox(width: 8.w),
        Text(
          coin.nameEN,
          style: tableMainEnTextStyle,
        ),
      ],
    );
  }

  Widget _priceCellBuilder({required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          price.toString(),
          style: tableMainEnTextStyle,
        ),
        SizedBox(width: 8.w),
        Text(
          '\$',
          style: tableSecondaryTextStyle.copyWith(fontSize: 11.sp),
        ),
      ],
    );
  }

  Widget _trendCellBuilder({required double trend}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 6.h,
          width: 4.w,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/icons/arrow-up.png'))),
        ),
        SizedBox(width: 6.h),
        Text(
          '$trend%',
          style: tableMainEnTextStyle.copyWith(color: const Color(0xFF80CE13)),
        ),
      ],
    );
  }

  Widget _coinGridCardBuilder({required Coin coin}) {
    return AnimatedCoinCard(coin: coin);
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

class AnimatedCoinCard extends StatefulWidget {
  const AnimatedCoinCard({super.key, required this.coin});
  final Coin coin;
  @override
  State<AnimatedCoinCard> createState() => _AnimatedCoinCardState();
}

class _AnimatedCoinCardState extends State<AnimatedCoinCard> {
  bool _showFront = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('تمت إضافة منبه جديد'),
        //   ),
        // );
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