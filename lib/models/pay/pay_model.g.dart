// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayModelImpl _$$PayModelImplFromJson(Map<String, dynamic> json) =>
    _$PayModelImpl(
      message: json['message'] as String? ?? '',
      error: json['error'] as String? ?? '',
    );

Map<String, dynamic> _$$PayModelImplToJson(_$PayModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
