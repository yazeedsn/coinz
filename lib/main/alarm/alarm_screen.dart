import 'dart:collection';

import 'package:coinz/main/alarm/alarm.dart';
import 'package:coinz/main/alarm/alarm_configuration_model.dart';
import 'package:coinz/main/alarm/alarm_model.dart';
import 'package:coinz/main/coin.dart';
import 'package:coinz/main/coins.dart';
import 'package:flutter/material.dart';

import 'package:coinz/widgets/outlined_container.dart';
import 'package:coinz/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({
    super.key,
  });

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
                  _coinSelectorBuilder(context),
                  SizedBox(height: 18.h),
                  const Text(
                    'يرجى تحديد قيمة المنبه',
                    style: secondaryStyle,
                  ),
                  SizedBox(height: 9.h),
                  _alarmValueSpeciferBuilder(context),
                  SizedBox(height: 20.h),
                  _addAlarmButtonBuilder(onTap: () {
                    AlarmConfigurationModel config =
                        context.read<AlarmConfigurationModel>();
                    _alarmButtonOnTap(context, config.selected, config.greater);
                  }),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
            const Divider(color: Color(0xFFF8F9FB)),
            SizedBox(height: 20.h),
            _alarmsListBuilder(context.read<AlarmModel>().alarms),
          ],
        ),
      ),
    );
  }

  void _showSnakBar(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _alarmButtonOnTap(BuildContext context, int coinId, bool greater) {
    FocusScope.of(context).unfocus();

    Alarm alarm = Alarm(
        coin: coins[coinId],
        value: double.parse(context
            .read<AlarmConfigurationModel>()
            .controller
            .text
            .replaceFirst('\$', '')),
        greater: greater);
    context.read<AlarmModel>().add(alarm);
    _showSnakBar(context, 'تمت إضافة منبه جديد');
  }

  Widget _coinSelectorBuilder(BuildContext context) {
    AlarmConfigurationModel model = context.read<AlarmConfigurationModel>();
    return OutlinedContainer(
      height: 56.h,
      padding: EdgeInsets.zero,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        value: model.selected,
        onChanged: (value) => model.changeCoin(value ?? 0),
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

  OutlinedContainer _alarmValueSpeciferBuilder(BuildContext context) {
    AlarmConfigurationModel model = context.read<AlarmConfigurationModel>();
    return OutlinedContainer(
      padding: EdgeInsets.zero,
      height: 56.h,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: _comparsionDropDownMenuBuilder(context),
          ),
          const VerticalDivider(
            color: Color(0xFFF8F8F8),
          ),
          Expanded(
            child: _priceTextfieldBuilder(controller: model.controller),
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField _comparsionDropDownMenuBuilder(BuildContext context) {
    AlarmConfigurationModel model = context.read<AlarmConfigurationModel>();
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: const InputDecoration(
        icon: null,
        border: InputBorder.none,
      ),
      value: (model.greater) ? 0 : 1,
      onChanged: (value) {
        model.flipGreater();
      },
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

  InkWell _addAlarmButtonBuilder({required void Function() onTap}) {
    return InkWell(
      onTap: () => onTap(),
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

  Padding _alarmsListBuilder(UnmodifiableListView<Alarm> alarms) {
    return Padding(
      padding: EdgeInsets.fromLTRB(22.w, 0.h, 22.w, 16.h),
      child: Consumer<AlarmModel>(
        builder: (BuildContext context, AlarmModel alarms, Widget? child) =>
            ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: alarms.length,
          itemBuilder: (context, index) => _alarmCardBuilder(
            () {
              alarms.remove(index);
              _showSnakBar(context, 'تم حذف المنبه');
            },
            alarm: alarms.get(index),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
        ),
      ),
    );
  }

  Widget _alarmCardBuilder(
    void Function() onTap, {
    required Alarm alarm,
  }) {
    return OutlinedContainer(
      height: 66.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _alarmCardIconBuilder(alarm.coin),
          SizedBox(width: 18.w),
          _alarmCardTextBuilder(alarm),
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

  Column _alarmCardTextBuilder(Alarm alarm) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              alarm.coin.nameAR,
              style: alarmCardEnStyle,
            ),
            SizedBox(width: 6.w),
            Text(
              alarm.coin.nameEN,
              style: alarmCardEnStyle,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              (alarm.greater) ? 'أكبر من' : 'أقل من',
              style: alarmCardEnStyle.copyWith(
                color: (alarm.greater)
                    ? const Color(0xFF38AD65)
                    : const Color(0xFFE72222),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              '${alarm.value}',
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
