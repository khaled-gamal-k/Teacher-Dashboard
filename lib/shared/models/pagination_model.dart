import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PaginationModel<T> {
  final List<T> data;
  final int total;

  const PaginationModel({required this.data, required this.total});

  factory PaginationModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationModelFromJson(json, fromJsonT);
}
