import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/constant/network_client.dart';


@lazySingleton
class ApiRequester {
  ApiRequester({
    required this.dio,
  });
  final Dio dio;

  Future<Response> getRequest(String lat,String long) async {
    final response = dio.get(
      '${BASE_URL}lat=$lat&lon=$long&appid=$API_KEY',
    );
    return response;
  }
}
