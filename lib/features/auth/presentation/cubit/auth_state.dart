import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.succses() = _Succses;
  const factory AuthState.failure(String message) = _Failure;
  const factory AuthState.loading() = _Loading;
}
