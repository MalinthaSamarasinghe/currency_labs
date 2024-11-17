import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'latest_currency_entity.g.dart';

@CopyWith()
class LatestCurrencyEntity extends Equatable {
  final bool? success;
  final int? timestamp;
  final String? base;
  final DateTime? date;
  final Map<String, double>? rates;

  const LatestCurrencyEntity({
    required this.success,
    required this.timestamp,
    required this.base,
    required this.date,
    required this.rates,
  });

  @override
  List<Object?> get props => [success, timestamp, date, rates];
}
