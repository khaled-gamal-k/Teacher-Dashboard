// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_performance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassPerformanceModel _$ClassPerformanceModelFromJson(
  Map<String, dynamic> json,
) => ClassPerformanceModel(
  className: json['class_name'] as String,
  points: (json['points'] as List<dynamic>)
      .map((e) => ChartsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);
