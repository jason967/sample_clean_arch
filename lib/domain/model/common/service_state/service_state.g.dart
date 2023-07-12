// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceState _$$_ServiceStateFromJson(Map<String, dynamic> json) =>
    _$_ServiceState(
      status: json['status'] as String? ?? 'SUCCESS',
      code: json['code'] as String? ?? '0000',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$_ServiceStateToJson(_$_ServiceState instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
