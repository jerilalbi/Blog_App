import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logo/logo.svg',
      height: 30,
    );
  }
}
