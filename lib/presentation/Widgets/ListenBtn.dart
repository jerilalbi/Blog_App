import 'package:blog_app/core/colors.dart';
import 'package:flutter/material.dart';

class ListenBtn extends StatelessWidget {
  final String btnText;
  final IconData icon;
  const ListenBtn({required this.btnText, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: secondaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            btnText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(
            width: 3,
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          )
        ],
      ),
    );
  }
}
