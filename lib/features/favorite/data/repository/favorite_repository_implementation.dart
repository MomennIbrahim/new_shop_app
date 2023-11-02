import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/core/utils/api_service.dart';
import 'package:route_app/features/favorite/data/repository/base_favorite_repository.dart';

import '../model/favorite_model/favorite_model.dart';

class FavoriteRepositoryImplementation implements BaseFavoriteRepository {
  ApiService apiService;

  FavoriteRepositoryImplementation(this.apiService);

  @override
  Future<Either<Failure, FavoriteModel>> getFavoriteData() async {
    try {
      var data = await apiService.getData(
        endPoint: 'favorites',
        token: token,
      );
      FavoriteModel favoriteModel = FavoriteModel.fromJson(data);
      return right(favoriteModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
