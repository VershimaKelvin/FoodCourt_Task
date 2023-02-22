import 'package:flutter/material.dart';
import 'package:task/core/navigator/route_name.dart';
import 'package:task/features/home/presentation/pages/home.dart';
import 'package:task/features/onboarding/presentation/pages/splash_screen.dart';
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SplashScreen(),
      );
    case Routes.home:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const WeatherScreen(),
      );
    default:
      return MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute<void>(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow!,
  );
}
