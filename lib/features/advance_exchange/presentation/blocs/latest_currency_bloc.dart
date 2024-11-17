import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../core/blocs/event_transformer.dart';
import '../../../../core/enums/bloc_state_status.dart';
import '../../domain/usecases/get_latest_currency.dart';
import '../../domain/repositories/latest_currency_repository.dart';
import '../../domain/entities/saved_currency/saved_currency_entity.dart';
import '../../domain/entities/latest_currency/latest_currency_entity.dart';

part 'latest_currency_event.dart';
part 'latest_currency_state.dart';

class LatestCurrencyBloc extends HydratedBloc<LatestCurrencyEvent, LatestCurrencyState> {
  final GetLatestCurrency getLatestCurrency;

  LatestCurrencyBloc({required this.getLatestCurrency}) : super(const LatestCurrencyState()) {
    on<AddLatestCurrencyEvent>(_addLatestCurrencyEvent, transformer: Transformer.throttleDroppable());
    // on<ChangeAmountEvent>(_changeAmountEvent, transformer: Transformer.throttleDebounce());
    // on<EditCurrencyEvent>(_editCurrencyEvent, transformer: Transformer.throttleDroppable());
    // on<RemoveCurrencyEvent>(_removeCurrencyEvent, transformer: Transformer.throttleDroppable());
  }

  Future<FutureOr<void>> _addLatestCurrencyEvent(AddLatestCurrencyEvent event, Emitter<LatestCurrencyState> emit) async {
    Either<Failure, LatestCurrencyEntity>? result = await getLatestCurrency(LatestCurrencyParam(
      baseCurrency: state.baseLatestCurrency.base,
      symbolCurrencies: event.currencySymbol,
    ));
    result.fold(
      (failure) {
        String message = "";
        if (failure is ServerFailure) {
          message = failure.message;
        } else if (failure is NoConnectionFailure) {
          message = "Please check your internet connection and try again!";
        } else {
          message = "Something went wrong. Please try again later!";
        }
        /// Only emit if data not fetch at least one time (Because other times, preserved state will receive from HydratedBloc)
        if (state.currencyStatus == BlocStateStatus.initial) {
          emit(state.copyWith(
            currencyStatus: BlocStateStatus.loadFailure,
            errorMessage: message,
          ));
        }
      },
      (data) {
        debugPrint("Data.success: ${data.success}");
        debugPrint("Data.timestamp: ${data.timestamp}");
        debugPrint("event.isoCode: ${event.isoCode}");
        debugPrint("Data.base: ${data.base}");
        debugPrint("Data.date: ${data.date}");
        debugPrint("Data.rates: ${data.rates}");

        List<SavedCurrencyEntity> tempList = state.savedCurrencyList;
        tempList.add(SavedCurrencyEntity(
          timestamp: data.timestamp,
          isoCode: event.isoCode,
          base: data.base,
          date: data.date,
          rates: 1.00,
          amount: 1.00,
        ));
        emit(LatestCurrencyState(
          currencyStatus: BlocStateStatus.loadSuccess,
          savedCurrencyList: tempList,
        ));
      },
    );
  }

  @override
  LatestCurrencyState? fromJson(Map<String, dynamic> json) {
    return LatestCurrencyState(
      currencyStatus: blocStateStatusValues.map[json['currencyStatus']] ?? BlocStateStatus.initial,
      baseLatestCurrency: SavedCurrencyEntity.fromJson(json['baseLatestCurrency']),
      savedCurrencyList: List<SavedCurrencyEntity>.from(json['savedCurrencyList'].map((e) => SavedCurrencyEntity.fromJson(e))),
      errorMessage: json['errorMessage'],

    );
  }

  @override
  Map<String, dynamic>? toJson(LatestCurrencyState state) {
    return {
      'currencyStatus': blocStateStatusValues.reverse[state.currencyStatus],
      'baseLatestCurrency': state.baseLatestCurrency.toJson(),
      'savedCurrencyList': state.savedCurrencyList.map((e) => e.toJson()).toList(),
      'errorMessage': state.errorMessage,
    };
  }
}
