import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/latest_currency_entity.dart';
import '../repositories/latest_currency_repository.dart';

class GetLatestCurrency implements UseCase<LatestCurrencyEntity, LatestCurrencyParam> {
  final LatestCurrencyRepository latestCurrencyRepository;

  GetLatestCurrency({
    required this.latestCurrencyRepository,
  });

  @override
  Future<Either<Failure, LatestCurrencyEntity>> call(LatestCurrencyParam param) async {
    return await latestCurrencyRepository.getLatestCurrency(param);
  }
}
