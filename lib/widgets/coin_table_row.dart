import 'package:flutter/material.dart';

class CoinTableRow extends StatelessWidget {
  const CoinTableRow({
    super.key,
    this.height,
    this.padding,
    this.backgroundColor,
    required this.children,
  });

  final double? height;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    assert(children.length == 3);

    return Container(
      height: height,
      padding: padding,
      color: backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: children[0]),
          Expanded(flex: 1, child: children[1]),
          Expanded(flex: 2, child: children[2]),
        ],
      ),
    );
  }
}
