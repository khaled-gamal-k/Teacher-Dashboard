// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel<T> _$PaginationModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginationModel<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  total: (json['total'] as num).toInt(),
);
