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

class ChangeBaseAmountEvent extends LatestCurrencyEvent {
  final String amount;

  const ChangeBaseAmountEvent({
    required this.amount,
  });

  @override
  List<Object> get props => [amount];
}

class ChangeBaseCurrencyEvent extends LatestCurrencyEvent {
  final String currencySymbol;
  final String isoCode;

  const ChangeBaseCurrencyEvent({
    required this.currencySymbol,
    required this.isoCode,
  });

  @override
  List<Object> get props => [currencySymbol, isoCode];
}

class EditConvertedCurrencyEvent extends LatestCurrencyEvent {
  final int index;
  final String currencySymbol;
  final String isoCode;

  const EditConvertedCurrencyEvent({
    required this.index,
    required this.currencySymbol,
    required this.isoCode,
  });

  @override
  List<Object> get props => [index, currencySymbol, isoCode];
}

class RemoveCurrencyEvent extends LatestCurrencyEvent {
  final int index;

  const RemoveCurrencyEvent({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}
