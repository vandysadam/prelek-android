import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  @JsonSerializable(explicitToJson: true)
  const factory WalletModel({
    @Default('') String id,
    @Default('') String userid,
    @Default(0) int balance,
    @Default('') String type,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}

@freezed
class ProfileModel with _$ProfileModel {
  @JsonSerializable(explicitToJson: true)
  const factory ProfileModel({
    @Default('') String name,
    @Default(0) int house_number,
    @Default('') String phone_number,
    @Default('') String address,
    WalletModel? wallet,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
class ApiResponse with _$ApiResponse {
  @JsonSerializable(explicitToJson: true)
  const factory ApiResponse({
    @Default('') String message,
    @Default(0) int statusCode,
    required ProfileModel data,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
