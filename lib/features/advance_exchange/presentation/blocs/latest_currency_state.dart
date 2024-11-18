part of 'latest_currency_bloc.dart';

class LatestCurrencyState extends Equatable {
  final BlocStateStatus currencyStatus;
  final SavedCurrencyEntity baseLatestCurrency;
  final List<SavedCurrencyEntity> savedCurrencyList;
  final String? errorMessage;

  const LatestCurrencyState({
    this.currencyStatus = BlocStateStatus.initial,
    this.baseLatestCurrency = const SavedCurrencyEntity(
      timestamp: null,
      isoCode: "DE",
      base: "EUR",
      date: null,
      rates: 0.0,
      amount: 1.00,
    ),
    this.savedCurrencyList = const [],
    this.errorMessage,
  });

  @override
  List<Object?> get props =>
      [
        currencyStatus,
        baseLatestCurrency,
        savedCurrencyList,
        errorMessage,
      ];

  LatestCurrencyState copyWith({
    BlocStateStatus? currencyStatus,
    SavedCurrencyEntity? baseLatestCurrency,
    List<SavedCurrencyEntity>? savedCurrencyList,
    String? errorMessage,
  }) {
    return LatestCurrencyState(
      currencyStatus: currencyStatus ?? this.currencyStatus,
      baseLatestCurrency: baseLatestCurrency ?? this.baseLatestCurrency,
      savedCurrencyList: savedCurrencyList ?? this.savedCurrencyList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
