import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String email,
    @Default('') String roles,
    @Default(0) int house_number,
    @Default('') String accessToken,
    @Default('') String refreshToken,
    @Default('') String error,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
