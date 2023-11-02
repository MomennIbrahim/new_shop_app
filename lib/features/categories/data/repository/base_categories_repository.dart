import 'package:dartz/dartz.dart';
import 'package:route_app/core/error/error.dart';
import '../../../home/data/model/categories_model/categories_model.dart';

abstract class BaseCategoriesRepository {

  Future<Either<Failure, CategoriesModel>> getCategoriesData();
}
