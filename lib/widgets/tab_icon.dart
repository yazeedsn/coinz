import 'package:flutter/material.dart';

class TabIcon extends StatelessWidget {
  const TabIcon({
    super.key,
    required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
