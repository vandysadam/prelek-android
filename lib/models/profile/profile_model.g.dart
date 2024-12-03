// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      id: json['id'] as String? ?? '',
      userid: json['userid'] as String? ?? '',
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'balance': instance.balance,
      'type': instance.type,
    };

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      name: json['name'] as String? ?? '',
      house_number: (json['house_number'] as num?)?.toInt() ?? 0,
      phone_number: json['phone_number'] as String? ?? '',
      address: json['address'] as String? ?? '',
      wallet: json['wallet'] == null
          ? null
          : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'house_number': instance.house_number,
      'phone_number': instance.phone_number,
      'address': instance.address,
      'wallet': instance.wallet?.toJson(),
    };

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      message: json['message'] as String? ?? '',
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
      data: ProfileModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data.toJson(),
    };
