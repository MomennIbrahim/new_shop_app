import 'package:dartz/dartz.dart';
import 'package:route_app/core/error/error.dart';
import '../../../cart/data/model/add_cart_model.dart';
import '../model/banner_model/banner_model.dart';
import '../model/categories_model/categories_model.dart';
import '../model/product_model/product_model.dart';

abstract class BaseHomeRepositories {
  Future<Either<Failure, BannerModel>> getBannerData();

  Future<Either<Failure, CategoriesModel>> getSubCategoriesData({int limit});

  Future<Either<Failure, ProductModel>> getProductData();

  Future<Either<Failure, ProductModel>> addProductInFavorite(
      {required int productId});

  Future<Either<Failure, PostCartModel>> postCart({required int productId});

}
