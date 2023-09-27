import 'package:flutter/material.dart';

import 'package:coinz/widgets/tab_icon.dart';
import 'package:coinz/constants/icons.dart';
import 'package:coinz/screens/alarm_screen.dart';
import 'package:coinz/screens/price_screen.dart';
import 'package:coinz/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    Container(),
    const AlarmScreen(),
    const PriceScreen()
  ];

  int _currentIndex = 2;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedFontSize: 8,
        unselectedFontSize: 8,
        items: [
          BottomNavigationBarItem(
            label: 'أخبار و تقارير',
            icon: (_currentIndex == 0)
                ? const TabIcon(image: newsTabActive)
                : const TabIcon(image: newsTabInactive),
          ),
          BottomNavigationBarItem(
            label: 'منبه العملات',
            icon: (_currentIndex == 1)
                ? const TabIcon(image: alarmTabActive)
                : const TabIcon(image: alarmTabInactive),
          ),
          BottomNavigationBarItem(
            label: 'أسعار العملات',
            icon: (_currentIndex == 2)
                ? const TabIcon(image: priceTabActive)
                : const TabIcon(image: priceTabInactive),
          ),
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}








// const Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [Text("العملة"), Text("السعر"), Text("التداول")],
// ),
// Expanded(
//   child: ListView.builder(
//       itemCount: 4,
//       itemBuilder: (context, index) => const Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('1'),
//               Text('بيتكوين'),
//               Text('Bitcoin'),
//               Text('1.18'),
//               Text('\$'),
//               Text('8.19%'),
//             ],
//           )),
// ),
// Container(
//   height: 55,
//   width: 320,
//   margin:
//       const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
//   alignment: Alignment.center,
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.all(Radius.circular(8)),
//     gradient: LinearGradient(
//       colors: [
//         Color(0xFFFFDB00),
//         Color(0xFFFFA500),
//       ],
//     ),
//   ),
//   child: const Text(
//     'اضـــافة تنبيه',
//     style: TextStyle(fontSize: 13),
//   ),
// )
