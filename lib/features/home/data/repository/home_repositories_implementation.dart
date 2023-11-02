import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/core/utils/api_service.dart';
import 'package:route_app/features/cart/data/model/add_cart_model.dart';
import '../model/banner_model/banner_model.dart';
import '../model/categories_model/categories_model.dart';
import '../model/product_model/product_model.dart';
import 'base_home_repositories.dart';

class HomeRepositoriesImplementation implements BaseHomeRepositories {
  ApiService apiService;

  HomeRepositoriesImplementation(this.apiService);

  @override
  Future<Either<Failure, BannerModel>> getBannerData() async {
    try {
      var data = await apiService.getData(endPoint: 'banners');
      BannerModel bannerModel = BannerModel.fromJson(data);
      return right(bannerModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> getSubCategoriesData(
      {int? limit}) async {
    try {
      var data = await apiService
          .getData2(endPoint: '/api/v1/subcategories', query: {'limit': limit});
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

  @override
  Future<Either<Failure, ProductModel>> getProductData() async {
    try {
      var data = await apiService.getData(endPoint: 'home', token: token);
      ProductModel productModel = ProductModel.fromJson(data);
      return right(productModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ProductModel>> addProductInFavorite(
      {required int productId}) async {
    try {
      var data = await apiService.postData(
        endPoint: 'favorites',
        token: token,
        data: {
          'product_id': productId,
        },
      );
      ProductModel productModel = ProductModel.fromJson(data);
      return right(productModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, PostCartModel>> postCart({required int productId}) async{
    try {
      var data = await apiService.postData(
        endPoint: 'carts',
        token: token,
        data: {
          "product_id" : productId
        },
      );
      PostCartModel postCartModel = PostCartModel.fromJson(data);
      return right(postCartModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
