import 'package:json_annotation/json_annotation.dart';

part 'charts_model.g.dart';

@JsonSerializable(createToJson: false)
class ChartsModel {
  final double x;
  final double y;

  ChartsModel({required this.x, required this.y});

  factory ChartsModel.fromJson(Map<String, dynamic> json) => _$ChartsModelFromJson(json);
}
