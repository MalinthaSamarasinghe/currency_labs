part of 'latest_currency_bloc.dart';

abstract class LatestCurrencyEvent extends Equatable {
  const LatestCurrencyEvent();
}

class AddLatestCurrencyEvent extends LatestCurrencyEvent {
  final String currencySymbol;
  final String isoCode;

  const AddLatestCurrencyEvent({
    required this.currencySymbol,
    required this.isoCode,
  });

  @override
  List<Object> get props => [currencySymbol, isoCode];
}

class ChangeAmountEvent extends LatestCurrencyEvent {
  final String amount;

  const ChangeAmountEvent({
    required this.amount,
  });

  @override
  List<Object> get props => [amount];
}

class EditCurrencyEvent extends LatestCurrencyEvent {
  final int index;
  final String currencySymbol;

  const EditCurrencyEvent({
    required this.index,
    required this.currencySymbol,
  });

  @override
  List<Object> get props => [index, currencySymbol];
}

class RemoveCurrencyEvent extends LatestCurrencyEvent {
  final int index;

  const RemoveCurrencyEvent({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}
