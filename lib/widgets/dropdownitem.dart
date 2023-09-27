import 'package:flutter/material.dart';
import 'package:coinz/styles.dart';

class DropDownItem extends StatelessWidget {
  const DropDownItem({
    super.key,
    this.nameAR,
    this.nameEN,
    this.icon,
  });

  final String? nameAR;
  final String? nameEN;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          nameEN ?? '',
          textAlign: TextAlign.end,
          style: dropdownEnStyle,
        ),
        const SizedBox(width: 8),
        Text(
          nameAR ?? '',
          style: dropdownArStyle,
          textAlign: TextAlign.end,
        ),
        const SizedBox(width: 12),
        (icon != null)
            ? Image.asset(icon ?? '', width: 23, height: 23)
            : const Visibility(visible: false, child: Text('')),
      ],
    );
  }
}
