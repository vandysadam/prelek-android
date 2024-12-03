// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayModel _$PayModelFromJson(Map<String, dynamic> json) {
  return _PayModel.fromJson(json);
}

/// @nodoc
mixin _$PayModel {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'error')
  String get error => throw _privateConstructorUsedError;

  /// Serializes this PayModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PayModelCopyWith<PayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayModelCopyWith<$Res> {
  factory $PayModelCopyWith(PayModel value, $Res Function(PayModel) then) =
      _$PayModelCopyWithImpl<$Res, PayModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'error') String error});
}

/// @nodoc
class _$PayModelCopyWithImpl<$Res, $Val extends PayModel>
    implements $PayModelCopyWith<$Res> {
  _$PayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayModelImplCopyWith<$Res>
    implements $PayModelCopyWith<$Res> {
  factory _$$PayModelImplCopyWith(
          _$PayModelImpl value, $Res Function(_$PayModelImpl) then) =
      __$$PayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'error') String error});
}

/// @nodoc
class __$$PayModelImplCopyWithImpl<$Res>
    extends _$PayModelCopyWithImpl<$Res, _$PayModelImpl>
    implements _$$PayModelImplCopyWith<$Res> {
  __$$PayModelImplCopyWithImpl(
      _$PayModelImpl _value, $Res Function(_$PayModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? error = null,
  }) {
    return _then(_$PayModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayModelImpl implements _PayModel {
  const _$PayModelImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'error') this.error = ''});

  factory _$PayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayModelImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'error')
  final String error;

  @override
  String toString() {
    return 'PayModel(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, error);

  /// Create a copy of PayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayModelImplCopyWith<_$PayModelImpl> get copyWith =>
      __$$PayModelImplCopyWithImpl<_$PayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayModelImplToJson(
      this,
    );
  }
}

abstract class _PayModel implements PayModel {
  const factory _PayModel(
      {@JsonKey(name: 'message') final String message,
      @JsonKey(name: 'error') final String error}) = _$PayModelImpl;

  factory _PayModel.fromJson(Map<String, dynamic> json) =
      _$PayModelImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'error')
  String get error;

  /// Create a copy of PayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayModelImplCopyWith<_$PayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
