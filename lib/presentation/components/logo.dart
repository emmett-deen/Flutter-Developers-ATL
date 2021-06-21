import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  final Color color;
  final double height;
  const Logo({
    Key? key,
    required this.color,
    this.height = kToolbarHeight - 32
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'logos/fdatl_logo.svg',
      height: height,
      color: color,
      semanticsLabel: 'logo',
    );
  }
}
