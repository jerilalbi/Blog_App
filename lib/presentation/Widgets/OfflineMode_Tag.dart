import 'package:flutter/material.dart';

class OfflineModeTag extends StatelessWidget {
  const OfflineModeTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
          )),
      child: const Text(
        "offline mode",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
