import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  final Color color;
  const Logo({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'logos/fdatl_logo.svg',
      height: kToolbarHeight - 32,
      color: color,
      semanticsLabel: 'logo',
    );
  }
}
