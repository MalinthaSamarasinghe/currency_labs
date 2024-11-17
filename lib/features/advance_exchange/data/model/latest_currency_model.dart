import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../../domain/entities/latest_currency/latest_currency_entity.dart';

LatestCurrencyModel latestCurrencyModelFromJson(String str) => LatestCurrencyModel.fromJson(json.decode(str));

String latestCurrencyModelToJson(LatestCurrencyModel data) => json.encode(data.toJson());

class LatestCurrencyModel extends Equatable {
  final bool? success;
  final int? timestamp;
  final String? base;
  final DateTime? date;
  final Map<String, double>? rates;

  const LatestCurrencyModel({
    this.success,
    this.timestamp,
    this.base,
    this.date,
    this.rates,
  });

  factory LatestCurrencyModel.fromJson(Map<String, dynamic> json) {
    return LatestCurrencyModel(
      success: json["success"],
      timestamp: json["timestamp"],
      base: json["base"],
      date: json["date"] == null ? null : DateTime.parse(json["date"]),
      rates: Map.from(json["rates"]!).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "timestamp": timestamp,
      "base": base,
      "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      "rates": Map.from(rates!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
  }

  LatestCurrencyEntity toEntity() {
    return LatestCurrencyEntity(
      success: success,
      timestamp: timestamp,
      isoCode: base,
      base: base,
      date: date,
      rates: rates,
    );
  }

  @override
  List<Object?> get props => [success, timestamp, date, rates];
}
