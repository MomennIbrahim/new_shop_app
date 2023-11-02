import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/core/utils/api_service.dart';
import 'package:route_app/features/categories/data/repository/base_categories_repository.dart';
import '../../../home/data/model/categories_model/categories_model.dart';

class CategoriesRepositoryImplementation implements BaseCategoriesRepository {
  ApiService apiService;

  CategoriesRepositoryImplementation(this.apiService);

  @override
  Future<Either<Failure, CategoriesModel>> getCategoriesData() async {
    try {
      var data = await apiService.getData2(endPoint: '/api/v1/categories');
      CategoriesModel categoriesModel = CategoriesModel.fromJson(data);
      return right(categoriesModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
