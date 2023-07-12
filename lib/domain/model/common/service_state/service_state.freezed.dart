// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceState _$ServiceStateFromJson(Map<String, dynamic> json) {
  return _ServiceState.fromJson(json);
}

/// @nodoc
mixin _$ServiceState {
  String get status => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceStateCopyWith<ServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStateCopyWith<$Res> {
  factory $ServiceStateCopyWith(
          ServiceState value, $Res Function(ServiceState) then) =
      _$ServiceStateCopyWithImpl<$Res, ServiceState>;
  @useResult
  $Res call({String status, String code, String message});
}

/// @nodoc
class _$ServiceStateCopyWithImpl<$Res, $Val extends ServiceState>
    implements $ServiceStateCopyWith<$Res> {
  _$ServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceStateCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory _$$_ServiceStateCopyWith(
          _$_ServiceState value, $Res Function(_$_ServiceState) then) =
      __$$_ServiceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String code, String message});
}

/// @nodoc
class __$$_ServiceStateCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$_ServiceState>
    implements _$$_ServiceStateCopyWith<$Res> {
  __$$_ServiceStateCopyWithImpl(
      _$_ServiceState _value, $Res Function(_$_ServiceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_$_ServiceState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceState with DiagnosticableTreeMixin implements _ServiceState {
  const _$_ServiceState(
      {this.status = 'SUCCESS', this.code = '0000', this.message = ''});

  factory _$_ServiceState.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceStateFromJson(json);

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServiceState(status: $status, code: $code, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServiceState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceStateCopyWith<_$_ServiceState> get copyWith =>
      __$$_ServiceStateCopyWithImpl<_$_ServiceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceStateToJson(
      this,
    );
  }
}

abstract class _ServiceState implements ServiceState {
  const factory _ServiceState(
      {final String status,
      final String code,
      final String message}) = _$_ServiceState;

  factory _ServiceState.fromJson(Map<String, dynamic> json) =
      _$_ServiceState.fromJson;

  @override
  String get status;
  @override
  String get code;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceStateCopyWith<_$_ServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}
