import 'package:dartz/dartz.dart';
import 'package:route_app/core/error/error.dart';
import '../model/favorite_model/favorite_model.dart';

abstract class BaseFavoriteRepository {

  Future<Either<Failure, FavoriteModel>> getFavoriteData();

}
