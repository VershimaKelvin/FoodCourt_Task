import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/core/usecase/usecase.dart';
import 'package:task/features/home/domain/entity/weather_entity.dart';
import 'package:task/features/home/domain/repository/weather_repository.dart';

@lazySingleton
class WeatherUseCase extends UseCase<WeatherEntity, WeatherParams> {
  WeatherUseCase({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  @override
  Future<Either<Failure,WeatherEntity>> call(
      WeatherParams params,
      ) =>
      weatherRepository.pullWeatherData(lat: params.lat, long: params.long);
}


class WeatherParams extends Equatable {
  const WeatherParams({
    required this.lat,
    required this.long,

  });
  final String lat;
  final String long;


  @override
  List<Object?> get props => [lat,long];
}
