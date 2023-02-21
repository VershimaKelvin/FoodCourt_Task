import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/usecase/usecase.dart';
import 'package:task/features/home/domain/entity/weather_entity.dart';
import 'package:task/features/home/domain/usecases/request_device_location_usecase.dart';
import 'package:task/features/home/domain/usecases/weather_usecase.dart';

@lazySingleton
class HomeNotifier extends ChangeNotifier {
  HomeNotifier({
    required this.weatherUseCase,
    required this.requestDeviceLocationUsecase,
  });

  final WeatherUseCase weatherUseCase;
  final RequestDeviceLocationUsecase requestDeviceLocationUsecase;


  bool hasPermission=false;
  WeatherEntity? weatherEntity;


  Future<void> requestDeviceLocation(BuildContext context) async {
    final response = await requestDeviceLocationUsecase(
      NoParams(),
    );
    response.fold(
          (l) {
      },
          (r) {
        hasPermission=true;
        notifyListeners();
      },
    );

  }

  //this converts the passed currencies
  Future<void> weatherData({required String lat,required String long}) async {
    final response = await weatherUseCase(
      WeatherParams(
        lat: lat,
        long: long,
      ),
    );
    return response.fold(
          (l) {},
          (r) {
            weatherEntity = r;
        notifyListeners();
      },
    );
  }


}