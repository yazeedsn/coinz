import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:coinz/modul/main/main_controller.dart';
import 'package:coinz/modul/main/alarm/alarm_controller.dart';
import 'package:coinz/modul/main/alarm/alarm_screen.dart';
import 'package:coinz/modul/main/home/home_screen.dart';
import 'package:coinz/modul/main/home/home_controller.dart';
import 'package:coinz/modul/main/news/news_screen.dart';
import 'package:coinz/app/icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> pages = const [
    HomeScreen(),
    AlarmScreen(),
    NewsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlarmController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
      ],
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBarBuilder(context),
        body: pages[context.watch<MainController>().selected],
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBarBuilder(BuildContext context) {
    int current = context.read<MainController>().selected;
    return BottomNavigationBar(
      currentIndex: current,
      onTap: (index) {
        context.read<MainController>().setSelected(index);
      },
      selectedFontSize: 8,
      unselectedFontSize: 8,
      items: [
        BottomNavigationBarItem(
          label: 'أسعار العملات',
          icon: (current == 0)
              ? _tapIconBuilder(image: priceTabActive)
              : _tapIconBuilder(image: priceTabInactive),
        ),
        BottomNavigationBarItem(
          label: 'منبه العملات',
          icon: (current == 1)
              ? _tapIconBuilder(image: alarmTabActive)
              : _tapIconBuilder(image: alarmTabInactive),
        ),
        BottomNavigationBarItem(
          label: 'أخبار و تقارير',
          icon: (current == 2)
              ? _tapIconBuilder(image: newsTabActive)
              : _tapIconBuilder(image: newsTabInactive),
        ),
      ],
    );
  }

  Widget _tapIconBuilder({required String image}) {
    return Container(
      width: 25.w,
      height: 25.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
