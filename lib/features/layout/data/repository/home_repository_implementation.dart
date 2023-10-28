import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/core/utils/api_service.dart';
import 'package:route_app/features/auth/data/model/user_model.dart';
import 'package:route_app/features/layout/data/model/banner_model/banner_model.dart';
import 'package:route_app/features/layout/data/model/categories_model/categories_model.dart';
import 'package:route_app/features/layout/data/model/favorite_model/Favorite_model.dart';
import 'package:route_app/features/layout/data/repository/base_home_repository.dart';
import '../model/product_model1/product_model.dart';

class HomeRepositoryImplementation implements BaseHomeHRepository {
  ApiService apiService;

  HomeRepositoryImplementation(this.apiService);

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

  @override
  Future<Either<Failure, CategoriesModel>> getSubCategoriesData(
      {int? limit}) async {
    try {
      var data = await apiService
          .getData2(endPoint: '/api/v1/brands', query: {'limit': limit});
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
      var data = await apiService.getData(endPoint: 'home');
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
        data: {'product_id': productId},
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

  UserModel? userModel;

  @override
  Future<Either<Failure, UserModel>> getPersonData() async {
    try {
      var data = await apiService.getData(
        endPoint: 'profile',
        token: token,
      );
      userModel = UserModel.fromJson(data);

      return right(userModel!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> updatePersonData(
      {required String name,
      required String email,
      required String phone}) async {
    try {
      var data = await apiService.putData(
        endPoint: 'update-profile',
        token: token,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
        },
      );
      userModel = UserModel.fromJson(data);
      return right(userModel!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async{
    try {
      var data = await apiService.postData(
        endPoint: 'change-password',
        token: token,
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );
      userModel = UserModel.fromJson(data);
      return right(userModel!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
