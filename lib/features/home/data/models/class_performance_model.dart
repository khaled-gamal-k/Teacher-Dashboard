import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/models/charts_model.dart';

part 'class_performance_model.g.dart';

@JsonSerializable(createToJson: false)
class ClassPerformanceModel {
  @JsonKey(name: 'class_name')
  final String className;
  final List<ChartsModel>? points;

  ClassPerformanceModel({required this.className, required this.points});

  factory ClassPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$ClassPerformanceModelFromJson(json);
}
