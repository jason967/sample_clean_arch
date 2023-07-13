import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/error/common_error.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.failure(CommonError error) = Error;
}
