import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/core/usecase/usecase.dart';
import 'package:task/features/home/domain/repository/weather_repository.dart';


@lazySingleton
class RequestDeviceLocationUsecase extends UseCase<bool, NoParams> {
  RequestDeviceLocationUsecase({
    required this.homeRepository,
  });

  final WeatherRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return homeRepository.requestDeviceLocation();
  }
}
