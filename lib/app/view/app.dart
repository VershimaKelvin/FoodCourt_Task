import 'package:flutter/material.dart';
import 'package:task/core/navigator/route_name.dart';
import 'package:task/core/navigator/router.dart';


class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      useInheritedMediaQuery: true,
      title: 'Weather App',
      initialRoute: Routes.splashScreen,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
