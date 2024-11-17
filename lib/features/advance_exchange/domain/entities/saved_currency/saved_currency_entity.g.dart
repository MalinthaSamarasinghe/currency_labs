// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_currency_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedCurrencyEntityImpl _$$SavedCurrencyEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SavedCurrencyEntityImpl(
      timestamp: (json['timestamp'] as num?)?.toInt(),
      isoCode: json['isoCode'] as String?,
      base: json['base'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      rates: json['rates'] as num?,
      amount: json['amount'] as num?,
    );

Map<String, dynamic> _$$SavedCurrencyEntityImplToJson(
        _$SavedCurrencyEntityImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'isoCode': instance.isoCode,
      'base': instance.base,
      'date': instance.date?.toIso8601String(),
      'rates': instance.rates,
      'amount': instance.amount,
    };
