import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final Icon icon;
  final Text text;

  CustomTab({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        text,
      ],
    );
  }
}
