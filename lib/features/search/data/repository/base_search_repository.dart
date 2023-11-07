import 'package:dartz/dartz.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/features/search/data/model/search_model.dart';

abstract class BaseSearchRepository {
  Future<Either<Failure,SearchModel>> getSearchData({required String searchText});
}