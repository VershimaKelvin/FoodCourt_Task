import 'package:flutter/material.dart';
import 'package:task/app/view/app.dart';
import 'package:task/bootstrap.dart';
import 'package:task/core/di/di_container.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  bootstrap(() => const App());
}
