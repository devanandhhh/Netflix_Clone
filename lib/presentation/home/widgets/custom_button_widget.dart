import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key, required this.icon, required this.title,this.iconsize=30,this.textsize=18});
  final IconData icon;
  final String title;
  final double iconsize;
  final double textsize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textsize),
        ),
      ],
    );
  }
}
