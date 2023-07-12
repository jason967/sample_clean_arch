import 'package:freezed_annotation/freezed_annotation.dart';

import '../service_state/service_state.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.error(ServiceState serviceState) = Error;
}
