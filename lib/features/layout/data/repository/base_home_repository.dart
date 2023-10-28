import 'package:dartz/dartz.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/features/auth/data/model/user_model.dart';
import 'package:route_app/features/layout/data/model/banner_model/banner_model.dart';
import 'package:route_app/features/layout/data/model/categories_model/categories_model.dart';
import 'package:route_app/features/layout/data/model/favorite_model/Favorite_model.dart';
import '../model/product_model1/product_model.dart';

abstract class BaseHomeHRepository {
  Future<Either<Failure, BannerModel>> getBannerData();

  Future<Either<Failure, CategoriesModel>> getCategoriesData();

  Future<Either<Failure, CategoriesModel>> getSubCategoriesData({int limit});

  Future<Either<Failure, ProductModel>> getProductData();

  Future<Either<Failure, FavoriteModel>> getFavoriteData();

  Future<Either<Failure, ProductModel>> addProductInFavorite(
      {required int productId});

  Future<Either<Failure, UserModel>> getPersonData();

  Future<Either<Failure, UserModel>> updatePersonData({
    required String name,
    required String email,
    required String phone,
  });

  Future<Either<Failure, UserModel>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
