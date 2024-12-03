import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_model.freezed.dart';
part 'pay_model.g.dart';

@freezed
class PayModel with _$PayModel {
  const factory PayModel(
      {@Default('') @JsonKey(name: 'message') String message,
      @Default('') @JsonKey(name: 'error') String error}) = _PayModel;

  factory PayModel.fromJson(Map<String, dynamic> json) =>
      _$PayModelFromJson(json);
}
