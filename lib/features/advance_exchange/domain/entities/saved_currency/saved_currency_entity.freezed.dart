// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_currency_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedCurrencyEntity _$SavedCurrencyEntityFromJson(Map<String, dynamic> json) {
  return _SavedCurrencyEntity.fromJson(json);
}

/// @nodoc
mixin _$SavedCurrencyEntity {
  int? get timestamp => throw _privateConstructorUsedError;
  String? get isoCode => throw _privateConstructorUsedError;
  String? get base => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  num? get rates => throw _privateConstructorUsedError;
  num? get amount => throw _privateConstructorUsedError;

  /// Serializes this SavedCurrencyEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedCurrencyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedCurrencyEntityCopyWith<SavedCurrencyEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedCurrencyEntityCopyWith<$Res> {
  factory $SavedCurrencyEntityCopyWith(
          SavedCurrencyEntity value, $Res Function(SavedCurrencyEntity) then) =
      _$SavedCurrencyEntityCopyWithImpl<$Res, SavedCurrencyEntity>;
  @useResult
  $Res call(
      {int? timestamp,
      String? isoCode,
      String? base,
      DateTime? date,
      num? rates,
      num? amount});
}

/// @nodoc
class _$SavedCurrencyEntityCopyWithImpl<$Res, $Val extends SavedCurrencyEntity>
    implements $SavedCurrencyEntityCopyWith<$Res> {
  _$SavedCurrencyEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedCurrencyEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = freezed,
    Object? isoCode = freezed,
    Object? base = freezed,
    Object? date = freezed,
    Object? rates = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      isoCode: freezed == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as num?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedCurrencyEntityImplCopyWith<$Res>
    implements $SavedCurrencyEntityCopyWith<$Res> {
  factory _$$SavedCurrencyEntityImplCopyWith(_$SavedCurrencyEntityImpl value,
          $Res Function(_$SavedCurrencyEntityImpl) then) =
      __$$SavedCurrencyEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? timestamp,
      String? isoCode,
      String? base,
      DateTime? date,
      num? rates,
      num? amount});
}

/// @nodoc
class __$$SavedCurrencyEntityImplCopyWithImpl<$Res>
    extends _$SavedCurrencyEntityCopyWithImpl<$Res, _$SavedCurrencyEntityImpl>
    implements _$$SavedCurrencyEntityImplCopyWith<$Res> {
  __$$SavedCurrencyEntityImplCopyWithImpl(_$SavedCurrencyEntityImpl _value,
      $Res Function(_$SavedCurrencyEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedCurrencyEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = freezed,
    Object? isoCode = freezed,
    Object? base = freezed,
    Object? date = freezed,
    Object? rates = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$SavedCurrencyEntityImpl(
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      isoCode: freezed == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as num?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedCurrencyEntityImpl implements _SavedCurrencyEntity {
  const _$SavedCurrencyEntityImpl(
      {required this.timestamp,
      required this.isoCode,
      required this.base,
      required this.date,
      required this.rates,
      required this.amount});

  factory _$SavedCurrencyEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedCurrencyEntityImplFromJson(json);

  @override
  final int? timestamp;
  @override
  final String? isoCode;
  @override
  final String? base;
  @override
  final DateTime? date;
  @override
  final num? rates;
  @override
  final num? amount;

  @override
  String toString() {
    return 'SavedCurrencyEntity(timestamp: $timestamp, isoCode: $isoCode, base: $base, date: $date, rates: $rates, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedCurrencyEntityImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isoCode, isoCode) || other.isoCode == isoCode) &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.rates, rates) || other.rates == rates) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timestamp, isoCode, base, date, rates, amount);

  /// Create a copy of SavedCurrencyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedCurrencyEntityImplCopyWith<_$SavedCurrencyEntityImpl> get copyWith =>
      __$$SavedCurrencyEntityImplCopyWithImpl<_$SavedCurrencyEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedCurrencyEntityImplToJson(
      this,
    );
  }
}

abstract class _SavedCurrencyEntity implements SavedCurrencyEntity {
  const factory _SavedCurrencyEntity(
      {required final int? timestamp,
      required final String? isoCode,
      required final String? base,
      required final DateTime? date,
      required final num? rates,
      required final num? amount}) = _$SavedCurrencyEntityImpl;

  factory _SavedCurrencyEntity.fromJson(Map<String, dynamic> json) =
      _$SavedCurrencyEntityImpl.fromJson;

  @override
  int? get timestamp;
  @override
  String? get isoCode;
  @override
  String? get base;
  @override
  DateTime? get date;
  @override
  num? get rates;
  @override
  num? get amount;

  /// Create a copy of SavedCurrencyEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedCurrencyEntityImplCopyWith<_$SavedCurrencyEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
