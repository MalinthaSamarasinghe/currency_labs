import 'package:dio/dio.dart';
import '../model/latest_currency_model.dart';
import '../../../../utils/api_endpoints.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/latest_currency_repository.dart';

abstract class LatestCurrencyRemoteDataSource {
  Future<LatestCurrencyModel> getLatestCurrencyData(LatestCurrencyParam latestCurrencyParam);
}

class LatestCurrencyRemoteDataSourceImpl implements LatestCurrencyRemoteDataSource {
  final DioClient dioClient;

  LatestCurrencyRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<LatestCurrencyModel> getLatestCurrencyData(LatestCurrencyParam latestCurrencyParam) async {
    try {
      Response response = await dioClient.public.get(ApiEndpoints.latestCurrency, queryParameters: latestCurrencyParam.toMap());
      return latestCurrencyModelFromJson(response.data);
    } on DioException catch (err) {
      throw ServerException.fromDioError(err);
    } catch (e) {
      throw ServerException(errorMessage: "$e", unexpectedError: true);
    }
  }
}
