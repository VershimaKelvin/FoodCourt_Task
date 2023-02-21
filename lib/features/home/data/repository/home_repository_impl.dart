import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/errors/error.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/home/data/datasource/local_datasource.dart';
import 'package:task/features/home/data/datasource/remote_datasource.dart';
import 'package:task/features/home/domain/entity/weather_entity.dart';
import 'package:task/features/home/domain/repository/weather_repository.dart';




@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  final WeatherRemoteDatasource remoteDatasource;
  final WeatherLocalDatasource localDatasource;


  @override
  Future<Either<Failure, bool>> requestDeviceLocation() async {
    try {
      final response = await localDatasource.requestDeviceLocation();
      return Right(response);
    } catch (e) {
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>> pullWeatherData({required String lat, required String long})async {
    try {
      final response = await remoteDatasource.getWeatherData(lat: lat, long: long);
      return Right(response);
    } catch (e) {
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        if (e.response?.data != null && e.response?.data != '') {
          return Left(
            ServerFailure(
              message: (e.response!.data as Map<String, dynamic>)['error'] ??
                  (e.response!.data as Map<String, dynamic>)['message'] ??
                  'Service unavailable, please try again!',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      return Left(
        UnknownFailure(),
      );
    }
  }

}
