import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/latest_currency_entity.dart';

abstract class LatestCurrencyRepository {
  Future<Either<Failure, LatestCurrencyEntity>> getLatestCurrency(LatestCurrencyParam param);
}

class LatestCurrencyParam extends Equatable {
  final String? baseCurrency;
  final String? symbolCurrencies;

  const LatestCurrencyParam({
    this.baseCurrency,
    this.symbolCurrencies,
  });

  @override
  List<Object?> get props => [baseCurrency, symbolCurrencies];

  Map<String, dynamic> toMap() {
    return {
      'base': baseCurrency.toString(),
      'symbols': symbolCurrencies.toString(),
    };
  }
}
