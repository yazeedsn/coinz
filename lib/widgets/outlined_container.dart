import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlinedContainer extends StatelessWidget {
  const OutlinedContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.outlineColor,
    required this.child,
  });

  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? outlineColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: outlineColor ?? const Color(0xFFF4F4F4)),
        borderRadius: borderRadius ?? BorderRadius.circular(8.r),
      ),
      child: child,
    );
  }
}
