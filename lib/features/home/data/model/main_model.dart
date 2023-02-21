import 'package:json_annotation/json_annotation.dart';

part 'main_model.g.dart';

@JsonSerializable()
class MainModel {
  MainModel(
      this.temp,
      this.pressure,
      this.humidity,
      );

  final double? temp;
  final int? pressure;
  final int? humidity;


  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);

}