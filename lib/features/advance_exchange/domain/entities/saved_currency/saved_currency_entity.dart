import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_currency_entity.g.dart';
part 'saved_currency_entity.freezed.dart';

@freezed
class SavedCurrencyEntity with _$SavedCurrencyEntity {
  const factory SavedCurrencyEntity({
    required int? timestamp,
    required String? isoCode,
    required String? base,
    required DateTime? date,
    required num? rates,
    required num? amount,
  }) = _SavedCurrencyEntity;

  factory SavedCurrencyEntity.fromJson(Map<String, Object?> json) => _$SavedCurrencyEntityFromJson(json);
}
