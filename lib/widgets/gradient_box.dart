import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({
    super.key,
    required this.startColor,
    required this.endColor,
  });

  final Color startColor, endColor;

  @override
  Widget build(BuildContext context) {
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
