// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:task/core/constant/network_client.dart';
//
//
// @lazySingleton
// class ApiRequester {
//   ApiRequester({
//     required this.dio,
//   });
//   final Dio dio;
//
//   Future<Response> getRequest({required String? queryParam}) async {
//     final response = dio.get(
//       BASE_URL + queryParam!,
//     );
//     return response;
//   }
// }
