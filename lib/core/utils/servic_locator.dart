import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_app/features/cart/data/repository/cart_repository_implementation.dart';
import 'package:route_app/features/categories/data/repository/categories_repository_implementation.dart';
import 'package:route_app/features/favorite/data/repository/favorite_repository_implementation.dart';
import 'package:route_app/features/person/data/repository/person_repository_implementation.dart';
import 'package:route_app/features/search/data/repository/search_repository_implementation.dart';
import '../../features/auth/data/repositories/auth_repository_implementation.dart';
import '../../features/home/data/repository/home_repositories_implementation.dart';
import 'api_service.dart';


GetIt  getIt = GetIt.instance;

void setupServiceLocator() {

  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<AuthRepositoryImplementation>(AuthRepositoryImplementation(
      getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<HomeRepositoriesImplementation>(HomeRepositoriesImplementation(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<CategoriesRepositoryImplementation>(CategoriesRepositoryImplementation(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<FavoriteRepositoryImplementation>(FavoriteRepositoryImplementation(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<CartRepositoriesImplementation>(CartRepositoriesImplementation(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<PersonRepositoryImplementation>(PersonRepositoryImplementation(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<SearchRepositoryImplementation>(SearchRepositoryImplementation(
    getIt.get<ApiService>(),
  ));

}