import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
import 'package:flutter_developers_atl/presentation/routes/routes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developers ATL',
      theme: ThemeData(
          primarySwatch: PRIMARY_SWATCH,
          textTheme: TextTheme().apply(bodyColor: DARK, displayColor: DARK),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontWeight: FontWeight.bold)))),
          appBarTheme: AppBarTheme(backgroundColor: OFF_WHITE, foregroundColor: PRIMARY, iconTheme: IconThemeData(color: PRIMARY))),
      onGenerateRoute: (settings) {
        for (var route in ROUTES) {
          if (route.matches(settings)) {
            return route.build(settings);
          }
        }
      },
    );
  }
}
