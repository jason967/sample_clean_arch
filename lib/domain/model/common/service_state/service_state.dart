import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_state.freezed.dart';

part 'service_state.g.dart';

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState({
    @Default('SUCCESS') String status,
    @Default('0000') String code,
    @Default('') String message,
  }) = _ServiceState;

  factory ServiceState.fromJson(Map<String, dynamic> json) =>
      _$ServiceStateFromJson(json);
}
