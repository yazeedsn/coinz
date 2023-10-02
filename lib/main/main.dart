import 'package:coinz/main/alarm/alarm_configuration_model.dart';
import 'package:coinz/main/alarm/alarm_model.dart';
import 'package:coinz/main/alarm/alarm_screen.dart';
import 'package:coinz/main/home/home_screen.dart';
import 'package:coinz/main/home/watch_model.dart';
import 'package:coinz/main/news/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:coinz/widgets/tab_icon.dart';
import 'package:coinz/constants/icons.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar')],
        debugShowCheckedModeBanner: false,
        title: 'Coinz',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages = const [
    HomeScreen(),
    AlarmScreen(),
    NewsScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlarmModel()),
        ChangeNotifierProvider(create: (context) => WatchModel()),
        ChangeNotifierProvider(create: (context) => AlarmConfigurationModel()),
      ],
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBarBuilder(),
        body: pages[_currentIndex],
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBar _bottomNavigationBarBuilder() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTap,
      selectedFontSize: 8,
      unselectedFontSize: 8,
      items: [
        BottomNavigationBarItem(
          label: 'أسعار العملات',
          icon: (_currentIndex == 0)
              ? const TabIcon(image: priceTabActive)
              : const TabIcon(image: priceTabInactive),
        ),
        BottomNavigationBarItem(
          label: 'منبه العملات',
          icon: (_currentIndex == 1)
              ? const TabIcon(image: alarmTabActive)
              : const TabIcon(image: alarmTabInactive),
        ),
        BottomNavigationBarItem(
          label: 'أخبار و تقارير',
          icon: (_currentIndex == 2)
              ? const TabIcon(image: newsTabActive)
              : const TabIcon(image: newsTabInactive),
        ),
      ],
    );
  }
}
