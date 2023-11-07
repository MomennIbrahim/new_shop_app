import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/core/utils/api_service.dart';
import 'package:route_app/features/search/data/model/search_model.dart';
import 'package:route_app/features/search/data/repository/base_search_repository.dart';
import '../../../../core/constance.dart';

class SearchRepositoryImplementation implements BaseSearchRepository {
  final ApiService apiService;

  SearchRepositoryImplementation(this.apiService);

  @override
  Future<Either<Failure, SearchModel>> getSearchData(
      {required String searchText}) async {
    try {
      var data = await apiService.postData(
        endPoint: 'products/search',
        token: token,
        data: {
          "text" : searchText,
        },
      );
      SearchModel searchModel = SearchModel.fromJson(data);
      return right(searchModel);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e.message));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
