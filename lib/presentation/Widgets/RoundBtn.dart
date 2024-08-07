import 'package:blog_app/core/colors.dart';
import 'package:flutter/material.dart';

class RoundBtn extends StatelessWidget {
  final IconData icon;
  const RoundBtn({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: secondaryColor),
        child: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ));
  }
}
