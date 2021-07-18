import 'package:flutter/material.dart';
import 'package:flutter_todo_app/bmicalculator/constants.dart';


class IconContent extends StatelessWidget {
  const IconContent({
    required this.icon,
    required this.name
  });

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          name,
          style: kLabelTextStyle
        )
      ],
    );
  }
}