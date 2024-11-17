// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_currency_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LatestCurrencyEntityCWProxy {
  LatestCurrencyEntity success(bool? success);

  LatestCurrencyEntity timestamp(int? timestamp);

  LatestCurrencyEntity base(String? base);

  LatestCurrencyEntity date(DateTime? date);

  LatestCurrencyEntity rates(Map<String, double>? rates);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LatestCurrencyEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LatestCurrencyEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  LatestCurrencyEntity call({
    bool? success,
    int? timestamp,
    String? base,
    DateTime? date,
    Map<String, double>? rates,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLatestCurrencyEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLatestCurrencyEntity.copyWith.fieldName(...)`
class _$LatestCurrencyEntityCWProxyImpl
    implements _$LatestCurrencyEntityCWProxy {
  const _$LatestCurrencyEntityCWProxyImpl(this._value);

  final LatestCurrencyEntity _value;

  @override
  LatestCurrencyEntity success(bool? success) => this(success: success);

  @override
  LatestCurrencyEntity timestamp(int? timestamp) => this(timestamp: timestamp);

  @override
  LatestCurrencyEntity base(String? base) => this(base: base);

  @override
  LatestCurrencyEntity date(DateTime? date) => this(date: date);

  @override
  LatestCurrencyEntity rates(Map<String, double>? rates) => this(rates: rates);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LatestCurrencyEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LatestCurrencyEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  LatestCurrencyEntity call({
    Object? success = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? base = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? rates = const $CopyWithPlaceholder(),
  }) {
    return LatestCurrencyEntity(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool?,
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as int?,
      base: base == const $CopyWithPlaceholder()
          ? _value.base
          // ignore: cast_nullable_to_non_nullable
          : base as String?,
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as DateTime?,
      rates: rates == const $CopyWithPlaceholder()
          ? _value.rates
          // ignore: cast_nullable_to_non_nullable
          : rates as Map<String, double>?,
    );
  }
}

extension $LatestCurrencyEntityCopyWith on LatestCurrencyEntity {
  /// Returns a callable class that can be used as follows: `instanceOfLatestCurrencyEntity.copyWith(...)` or like so:`instanceOfLatestCurrencyEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LatestCurrencyEntityCWProxy get copyWith =>
      _$LatestCurrencyEntityCWProxyImpl(this);
}
