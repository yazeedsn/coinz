import 'package:coinz/screens/main/coins.dart';
import 'package:coinz/screens/main/alarm/alarm.dart';
import 'package:flutter/material.dart';

import 'package:coinz/widgets/outlined_container.dart';
import 'package:coinz/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({
    super.key,
  });

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  final List<Alarm> alarms = [];

  final TextEditingController priceValueController = TextEditingController();
  int coinId = 0;
  bool greater = true;

  @override
  void initState() {
    priceValueController.text = '\$100000';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 30.h),
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'منبه العملات',
                    style: headingStyle,
                  ),
                  SizedBox(height: 5.h),
                  const Text(
                    'يرجى اختيار نوع العملة',
                    style: secondaryStyle,
                  ),
                  SizedBox(height: 9.h),
                  _coinSelectorBuilder(
                      onChange: (value) => coinId = value ?? 0),
                  SizedBox(height: 18.h),
                  const Text(
                    'يرجى تحديد قيمة المنبه',
                    style: secondaryStyle,
                  ),
                  SizedBox(height: 9.h),
                  _alarmValueSpeciferBuilder(controller: priceValueController),
                  SizedBox(height: 20.h),
                  _addAlarmButtonBuilder(onTap: _alarmButtonOnTap),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
            const Divider(color: Color(0xFFF8F9FB)),
            SizedBox(height: 20.h),
            _alarmsListBuilder(alarms),
          ],
        ),
      ),
    );
  }

  void _showSnakBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تمت إضافة منبه جديد'),
      ),
    );
  }

  void _alarmButtonOnTap() {
    FocusScope.of(context).unfocus();

    setState(() {
      alarms.add(
        Alarm(
            coin: coins[coinId],
            value:
                double.parse(priceValueController.text.replaceFirst('\$', '')),
            greater: greater),
      );
    });

    _showSnakBar('تمت إضافة منبه جديد');
  }

  OutlinedContainer _coinSelectorBuilder(
      {required void Function(int?) onChange}) {
    return OutlinedContainer(
      height: 56.h,
      padding: EdgeInsets.zero,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        value: 0,
        onChanged: onChange,
        items: [
          for (Coin coin in coins)
            DropdownMenuItem(
              value: coin.id,
              child: _coinDropdownMenuChild(
                  nameAR: coin.nameAR, nameEN: coin.nameEN, icon: coin.icon),
            )
        ],
      ),
    );
  }

  Widget _coinDropdownMenuChild(
      {required String nameAR, required String nameEN, required String icon}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon, width: 23.w, height: 23.h),
        SizedBox(width: 12.w),
        Text(
          nameAR,
          style: dropdownArStyle,
          textAlign: TextAlign.start,
        ),
        SizedBox(width: 8.w),
        Text(
          nameEN,
          textAlign: TextAlign.start,
          style: dropdownEnStyle,
        ),
      ],
    );
  }

  OutlinedContainer _alarmValueSpeciferBuilder(
      {required TextEditingController controller}) {
    return OutlinedContainer(
      padding: EdgeInsets.zero,
      height: 56.h,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: _comparsionDropDownMenuBuilder()),
          const VerticalDivider(
            color: Color(0xFFF8F8F8),
          ),
          Expanded(
            child: _priceTextfieldBuilder(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField _comparsionDropDownMenuBuilder() {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: const InputDecoration(
        icon: null,
        border: InputBorder.none,
      ),
      value: 0,
      onChanged: (value) {},
      items: const [
        DropdownMenuItem(
            alignment: Alignment.center,
            value: 0,
            child: Text(
              'أكبر من',
              textAlign: TextAlign.end,
            )),
        DropdownMenuItem(
          alignment: Alignment.center,
          value: 1,
          child: Text('أقل من'),
        ),
      ],
    );
  }

  InkWell _addAlarmButtonBuilder({void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.h,
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
        child: Text(
          'اضـــافة تنبيه',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Swossra',
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Padding _alarmsListBuilder(List<Alarm> alarms) {
    return Padding(
      padding: EdgeInsets.fromLTRB(22.w, 0.h, 22.w, 16.h),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: alarms.length,
        itemBuilder: (context, index) => _alarmCardBuilder(
          () {
            setState(() {
              alarms.removeAt(index);
            });
            _showSnakBar('تم حذف المنبه');
          },
          coin: alarms[index].coin,
          threshold: alarms[index].value,
          greater: alarms[index].greater,
        ),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
      ),
    );
  }

  Widget _alarmCardBuilder(
    void Function() onTap, {
    required Coin coin,
    required double threshold,
    required bool greater,
  }) {
    return OutlinedContainer(
      height: 66.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _alarmCardIconBuilder(coin),
          SizedBox(width: 18.w),
          _alarmCardTextBuilder(coin, greater, threshold),
          const Expanded(child: SizedBox(width: 1)),
          InkWell(
            onTap: onTap,
            child: Image.asset(
              'assets/icons/trash.png',
              width: 12.w,
              height: 16.h,
            ),
          ),
        ],
      ),
    );
  }

  Column _alarmCardTextBuilder(Coin coin, bool greater, double threshold) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              coin.nameAR,
              style: alarmCardEnStyle,
            ),
            SizedBox(width: 6.w),
            Text(
              coin.nameEN,
              style: alarmCardEnStyle,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              (greater) ? 'أكبر من' : 'أقل من',
              style: alarmCardEnStyle.copyWith(
                color: (greater)
                    ? const Color(0xFF38AD65)
                    : const Color(0xFFE72222),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              '$threshold',
              style: priceCardStyle.copyWith(
                color: const Color(0xFF38AD65),
              ),
            ),
            Text(
              '\$',
              style: alarmCardEnStyle.copyWith(
                color: const Color(0xFF38AD65),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _alarmCardIconBuilder(Coin coin) {
    return Container(
      width: 20.r,
      height: 20.r,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(coin.icon, fit: BoxFit.contain),
    );
  }

  TextField _priceTextfieldBuilder(
      {required TextEditingController controller}) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: const InputDecoration(border: InputBorder.none),
      keyboardType: TextInputType.number,
      controller: controller,
      onChanged: (value) {
        if (!controller.text.startsWith('\$')) controller.text = '\$$value';
      },
    );
  }
}
