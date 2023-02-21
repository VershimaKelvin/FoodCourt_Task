import 'package:equatable/equatable.dart';
import 'package:task/features/home/data/model/main_model.dart';
import 'package:task/features/home/data/model/wind_model.dart';


class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.main,
    required this.wind,
  });

  final MainModel? main;
  final WindModel? wind;



  @override
  List<Object?> get props => [
    main,
    wind,
  ];
}
