import 'package:flutter/material.dart';

class InstantRoute extends PageRouteBuilder {
  final Function(BuildContext) builder;
  @override
  final RouteSettings settings;
  InstantRoute({required this.builder, required this.settings})
      : super(
          settings: settings,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              child,
        );
}
