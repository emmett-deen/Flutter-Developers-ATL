import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
import 'package:flutter_developers_atl/presentation/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developers ATL',
      theme: ThemeData(
        primarySwatch: PRIMARY_SWATCH,
        appBarTheme: AppBarTheme(backgroundColor: OFF_WHITE)
      ),
      home: HomeScreen(),
    );
  }
}
