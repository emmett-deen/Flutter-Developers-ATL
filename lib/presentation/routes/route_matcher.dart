import 'package:flutter/material.dart';

import 'instant_route.dart';

class RouteMatcher {
  final String route;
  final Function(BuildContext context, Map<String, dynamic> params) builder;

  RouteMatcher({required this.route, required this.builder});

  bool matches(RouteSettings settings) {
    var matches = true;
    var routeParts = route.split('/');
    var urlParts = (settings.name ?? '/').split('/');

    if (routeParts.length == urlParts.length) {
      for (var i = 0; i < routeParts.length; i++) {
        if (!routeParts[i].startsWith(':') && routeParts[i] != urlParts[i]) {
          matches = false;
        }
      }
    } else {
      matches = false;
    }
    return matches;
  }

  Map<String, dynamic> params(RouteSettings settings) {
    if (matches(settings)) {
      var params = <String, dynamic>{};
      var routeParts = route.split('/');
      var urlParts = (settings.name ?? '/').split('/');
      for (var i = 0; i < routeParts.length; i++) {
        if (routeParts[i].startsWith(':')) {
          params[routeParts[i].substring(1)] = urlParts[i];
        }
      }
      return params;
    } else {
      return {};
    }
  }

  PageRouteBuilder build(RouteSettings settings) {
    return InstantRoute(
      settings: settings,
      builder: (context) {
        return builder(context, params(settings));
      },
    );
  }
}
