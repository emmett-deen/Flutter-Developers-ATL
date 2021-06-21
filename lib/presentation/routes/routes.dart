library routes;

import 'package:flutter_developers_atl/presentation/routes/route_matcher.dart';
import 'package:flutter_developers_atl/presentation/screens/under_construction/under_construction_screen.dart';

final List<RouteMatcher> ROUTES = [
  RouteMatcher(
    route: '/',
    builder: (context, params) {
      return UnderConstructionScreen();
    },
  )
];
