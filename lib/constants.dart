library constants;

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var log = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 3,
  colors: true,
  printTime: false,
  printEmojis: true,
));

// Colors
Map<int, Color> color = {
  50: Color.fromRGBO(3, 115, 140, .1),
  100: Color.fromRGBO(3, 115, 140, .2),
  200: Color.fromRGBO(3, 115, 140, .3),
  300: Color.fromRGBO(3, 115, 140, .4),
  400: Color.fromRGBO(3, 115, 140, .5),
  500: Color.fromRGBO(3, 115, 140, .6),
  600: Color.fromRGBO(3, 115, 140, .7),
  700: Color.fromRGBO(3, 115, 140, .8),
  800: Color.fromRGBO(3, 115, 140, .9),
  900: Color.fromRGBO(3, 115, 140, 1),
};
MaterialColor PRIMARY_SWATCH = MaterialColor(0xff03738c, color);
Color PRIMARY = Color(0xff03738c);
Color PRIMARY_DARK = Color(0xff00475f);
Color PRIMARY_LIGHT = Color(0xff4da2bc);
Color GREY = Color(0xffa3babf);
Color OFF_WHITE = Color(0xfff2f2f2);
Color DARK = Color(0xff011F26);
