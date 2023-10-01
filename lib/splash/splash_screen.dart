import 'dart:async';

import 'package:coinz/main/main.dart';
import 'package:flutter/material.dart';
import 'package:coinz/constants/styles.dart';

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
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
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
            backgroundLayerBuilder(),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridView backgroundLayerBuilder() {
    return GridView.count(
      childAspectRatio: 0.5,
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: <Widget>[
        gradientBoxBuilder(
          startColor: const Color(0xFFFFDB00),
          endColor: const Color(0xFFFFA500),
        ),
        gradientBoxBuilder(
          startColor: const Color(0xFF9B81EC),
          endColor: const Color(0xFFFB79B4),
        ),
        gradientBoxBuilder(
          startColor: const Color(0xFF58C4D8),
          endColor: const Color(0xFF478EDA),
        ),
        gradientBoxBuilder(
          startColor: const Color(0xFF02DFB6),
          endColor: const Color(0xFF47E546),
        ),
      ],
    );
  }

  Container gradientBoxBuilder(
      {required Color startColor, required Color endColor}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            startColor,
            endColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
