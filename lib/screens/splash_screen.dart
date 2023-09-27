import 'dart:async';

import 'package:coinz/main.dart';
import 'package:flutter/material.dart';
import 'package:coinz/widgets/gradient_box.dart';
import 'package:coinz/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: [
            GridView.count(
              childAspectRatio: 0.5,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: const <Widget>[
                GradientBox(
                  startColor: Color(0xFFFFDB00),
                  endColor: Color(0xFFFFA500),
                ),
                GradientBox(
                  startColor: Color(0xFF9B81EC),
                  endColor: Color(0xFFFB79B4),
                ),
                GradientBox(
                  startColor: Color(0xFF58C4D8),
                  endColor: Color(0xFF478EDA),
                ),
                GradientBox(
                  startColor: Color(0xFF02DFB6),
                  endColor: Color(0xFF47E546),
                ),
              ],
            ),
            const Expanded(child: SizedBox(height: 1)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('بلوك', style: splashStyle),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'تشين',
                          style: splashStyle,
                        ),
                        const SizedBox(height: 80),
                        Image.asset(
                          'assets/logo/box.png',
                          width: 150,
                          height: 135,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: 150,
                  //   height: 135,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(16),
                  //     border: Border.all(width: 15, color: Colors.white),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
