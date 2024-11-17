import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/network/dio_client.dart';
import 'core/network/network_info.dart';
import 'core/repositories/auth_repository.dart';
import 'core/blocs/authentication/auth_bloc.dart';
import 'core/network/interceptors/authorization_interceptor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> setupLocators() async {
  /// Feature: authentication
  // Blocs
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(authenticationRepository: sl()));
  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository());

  /// Network
  sl.registerFactory<Dio>(() => Dio());
  sl.registerFactory<DioClient>(() => DioClient(public: sl<Dio>(), auth: sl<Dio>()..interceptors.add(sl<AuthorizationInterceptor>())));
  sl.registerFactory<AuthorizationInterceptor>(() => AuthorizationInterceptor(authBloc: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
}
