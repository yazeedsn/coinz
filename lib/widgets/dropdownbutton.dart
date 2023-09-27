import 'package:flutter/material.dart';
import 'dropdownitem.dart';

class DropDownButton extends StatelessWidget {
  const DropDownButton({
    super.key,
    required this.items,
  });

  final List<DropDownItem> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        icon: Visibility(
            visible: false, child: Image.asset('assets/icons/btc2.png')),
        decoration: const InputDecoration(
            icon: null,
            border: InputBorder.none,
            prefixIcon: Icon(Icons.arrow_drop_down)),
        items: items.map((e) => DropdownMenuItem(child: e)).toList(),
        onChanged: (x) {});
  }
}
