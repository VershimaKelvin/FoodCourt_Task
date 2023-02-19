import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio();
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
}
