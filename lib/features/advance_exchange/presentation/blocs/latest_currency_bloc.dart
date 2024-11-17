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
  final TextEditingController baseAmountController = TextEditingController();

  @override
  Future<void> close() {
    baseAmountController.dispose();
    return super.close();
  }

  LatestCurrencyBloc({required this.getLatestCurrency}) : super(const LatestCurrencyState()) {
    on<AddLatestCurrencyEvent>(_addLatestCurrencyEvent, transformer: Transformer.throttleDroppable());
    on<ChangeBaseAmountEvent>(_changeBaseAmountEvent, transformer: Transformer.throttleDebounce());
    on<ChangeBaseCurrencyEvent>(_changeBaseCurrencyEvent, transformer: Transformer.throttleDroppable());
    on<EditConvertedCurrencyEvent>(_editConvertedCurrencyEvent, transformer: Transformer.throttleDroppable());
    on<RemoveCurrencyEvent>(_removeCurrencyEvent, transformer: Transformer.throttleDroppable());
  }

  Future<FutureOr<void>> _addLatestCurrencyEvent(AddLatestCurrencyEvent event, Emitter<LatestCurrencyState> emit) async {
    emit(state.copyWith(currencyStatus: BlocStateStatus.loadInProgress));
    Either<Failure, LatestCurrencyEntity>? result = await getLatestCurrency(LatestCurrencyParam(
      baseCurrency: state.baseLatestCurrency.base,
      symbolCurrencies: event.currencySymbol,
    ));
    result.fold(
      (failure) {
        String message = "";
        if (failure is ServerFailure) {
          message = failure.message;
          if(message == "Bad request!") {
            message = "Your subscription plan only allows EUR-based currency conversion!";
          }
        } else if (failure is NoConnectionFailure) {
          message = "Please check your internet connection and try again!";
        } else {
          message = "Something went wrong. Please try again later!";
        }
        emit(state.copyWith(
          currencyStatus: BlocStateStatus.loadFailure,
          errorMessage: message,
        ));
      },
      (data) {
        final ratesMap = data.rates as Map<String, double>;
        double rateValue = ratesMap[event.currencySymbol] ?? 0.0;
        num amount = (state.baseLatestCurrency.amount ?? 1.00) * rateValue;
        debugPrint("Base Amount: ${state.baseLatestCurrency.amount ?? 1.00} * Rate Value: $rateValue = Amount: $amount");

        List<SavedCurrencyEntity> tempList = state.savedCurrencyList.toList();
        tempList.add(SavedCurrencyEntity(
          timestamp: data.timestamp,
          isoCode: event.isoCode,
          base: event.currencySymbol,
          date: data.date,
          rates: rateValue as num,
          amount: amount,
        ));
        emit(LatestCurrencyState(
          currencyStatus: BlocStateStatus.loadSuccess,
          savedCurrencyList: tempList,
        ));
      },
    );
  }

  FutureOr<void> _changeBaseAmountEvent(ChangeBaseAmountEvent event, Emitter<LatestCurrencyState> emit) {
    if(state.savedCurrencyList.isNotEmpty) {
      SavedCurrencyEntity tempBaseLatestCurrency = state.baseLatestCurrency.copyWith(amount: num.tryParse(event.amount) ?? 1.00);
      emit(state.copyWith(
        currencyStatus: BlocStateStatus.initial,
        savedCurrencyList: [],
        baseLatestCurrency: tempBaseLatestCurrency,
      ));
    } else {
      emit(state.copyWith(
        currencyStatus: BlocStateStatus.initial,
        baseLatestCurrency: state.baseLatestCurrency.copyWith(amount: num.tryParse(event.amount) ?? 1.00),
      ));
    }
  }

  FutureOr<void> _changeBaseCurrencyEvent(ChangeBaseCurrencyEvent event, Emitter<LatestCurrencyState> emit) {
    if(state.savedCurrencyList.isNotEmpty) {
      SavedCurrencyEntity tempBaseLatestCurrency = state.baseLatestCurrency.copyWith(base: event.currencySymbol, isoCode: event.isoCode);
      emit(state.copyWith(
        currencyStatus: BlocStateStatus.loadSuccess,
        savedCurrencyList: [],
        baseLatestCurrency: tempBaseLatestCurrency,
      ));
    } else {
      emit(state.copyWith(
        currencyStatus: BlocStateStatus.loadSuccess,
        baseLatestCurrency: state.baseLatestCurrency.copyWith(base: event.currencySymbol, isoCode: event.isoCode),
      ));
    }
  }

  Future<FutureOr<void>> _editConvertedCurrencyEvent(EditConvertedCurrencyEvent event, Emitter<LatestCurrencyState> emit) async {
    emit(state.copyWith(currencyStatus: BlocStateStatus.loadInProgress));
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
        emit(state.copyWith(
          currencyStatus: BlocStateStatus.loadFailure,
          errorMessage: message,
        ));
      },
      (data) {
        final ratesMap = data.rates as Map<String, double>;
        double rateValue = ratesMap[event.currencySymbol] ?? 0.0;
        num amount = (state.baseLatestCurrency.amount ?? 1.00) * rateValue;
        debugPrint("Base Amount: ${state.baseLatestCurrency.amount ?? 1.00} * Rate Value: $rateValue = Amount: $amount");

        List<SavedCurrencyEntity> tempList = state.savedCurrencyList.toList();

        tempList[event.index] = SavedCurrencyEntity(
          timestamp: data.timestamp,
          isoCode: event.isoCode,
          base: event.currencySymbol,
          date: data.date,
          rates: rateValue as num,
          amount: amount,
        );

        emit(LatestCurrencyState(
          currencyStatus: BlocStateStatus.loadSuccess,
          savedCurrencyList: tempList,
        ));
      },
    );
  }

  FutureOr<void> _removeCurrencyEvent(RemoveCurrencyEvent event, Emitter<LatestCurrencyState> emit) {
    List<SavedCurrencyEntity> tempList = state.savedCurrencyList.toList();
    tempList.removeAt(event.index);
    emit(state.copyWith(currencyStatus: BlocStateStatus.initial, savedCurrencyList: tempList));
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
