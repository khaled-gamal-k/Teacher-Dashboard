import 'package:json_annotation/json_annotation.dart';

part 'signin_input_model.g.dart';

@JsonSerializable(createFactory: false)
class SigninInputModel {
  final String email;
  final String password;

  SigninInputModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$SigninInputModelToJson(this);
}
