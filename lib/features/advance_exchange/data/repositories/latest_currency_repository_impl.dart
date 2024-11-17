import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/latest_currency_remote_data_source.dart';
import '../../domain/repositories/latest_currency_repository.dart';
import '../../domain/entities/latest_currency/latest_currency_entity.dart';

class LatestCurrencyRepositoryImpl implements LatestCurrencyRepository {
  final LatestCurrencyRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const LatestCurrencyRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LatestCurrencyEntity>> getLatestCurrency(LatestCurrencyParam param) async {
    if (await networkInfo.isConnectedToInternet) {
      try {
        final currencyData = await remoteDataSource.getLatestCurrencyData(param);
        return Right(currencyData.toEntity());
      } on ServerException catch (serverException) {
        return Left(ServerFailure(message: serverException.errorMessage));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
