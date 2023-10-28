import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_app/features/layout/data/repository/home_repository_implementation.dart';
import '../../features/auth/data/repositories/auth_repository_implementation.dart';
import 'api_service.dart';


GetIt  getIt = GetIt.instance;

void setupServiceLocator() {

  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<AuthRepositoryImplementation>(AuthRepositoryImplementation(
      getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<HomeRepositoryImplementation>(HomeRepositoryImplementation(
    getIt.get<ApiService>(),
  ));

}