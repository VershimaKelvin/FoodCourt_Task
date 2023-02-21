import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/di/di_container.config.dart';


GetIt di = GetIt.instance;
@injectableInit

Future<void> configureDependencies() => $initGetIt(di);
