import 'package:injectable/injectable.dart';
import 'package:task/core/location/device_location.dart';

abstract class WeatherLocalDatasource {
  Future<bool> requestDeviceLocation();
}

@LazySingleton(as: WeatherLocalDatasource)
class WeatherLocalDatasourceImpl implements WeatherLocalDatasource {
  WeatherLocalDatasourceImpl({
    required this.deviceLocation,
  });

  final DeviceLocation deviceLocation;

  @override
  Future<bool> requestDeviceLocation() async {
    return deviceLocation.requestPermission();
  }
}
