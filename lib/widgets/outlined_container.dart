import 'package:flutter/material.dart';

class OutlinedContainer extends StatelessWidget {
  const OutlinedContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    required this.child,
  });

  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF4F4F4)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
