import 'package:json_annotation/json_annotation.dart';
import 'package:task/features/home/data/model/main_model.dart';
import 'package:task/features/home/data/model/wind_model.dart';
import 'package:task/features/home/domain/entity/weather_entity.dart';
part 'weather_model.g.dart';
@JsonSerializable()
class WeatherModel extends WeatherEntity{
  const WeatherModel({
    MainModel? main,
    WindModel? wind,
  }) : super(
    main:main,
    wind:wind,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);


}

