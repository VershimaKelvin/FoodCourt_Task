import 'package:injectable/injectable.dart';
import 'package:task/core/errors/error.dart';
import 'package:task/core/network/api_requester.dart';
import 'package:task/core/network/network_info.dart';
import 'package:task/features/home/data/model/weather_model.dart';

abstract class WeatherRemoteDatasource {
  
  Future<WeatherModel> getWeatherData({
    required String lat,
    required String long,
  });

}
@LazySingleton(as: WeatherRemoteDatasource)
class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  WeatherRemoteDatasourceImpl({
    required this.networkInfo,
    required this.apiRequester,
  });
  final NetworkInfo networkInfo;
  final ApiRequester apiRequester;

  @override
  Future<WeatherModel> getWeatherData({required String lat, required String long})async {

    if (await networkInfo.isConnected) {
      final response = await apiRequester.getRequest(lat,long);

      final six = (response.data as Map<String, dynamic>);
      return WeatherModel.fromJson(six);

    } else {
      throw NoInternetException();
    }
  }



}