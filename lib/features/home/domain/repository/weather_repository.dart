import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/home/domain/entity/weather_entity.dart';

abstract class WeatherRepository{
  Future<Either<Failure, WeatherEntity>> pullWeatherData({
    required String lat,
    required String long,
  });
  Future<Either<Failure, bool>> requestDeviceLocation();
}