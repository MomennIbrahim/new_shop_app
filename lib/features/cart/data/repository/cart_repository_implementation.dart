import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/core/utils/api_service.dart';
import 'package:route_app/features/cart/data/model/add_cart_model.dart';
import 'package:route_app/features/cart/data/model/carts_model.dart';
import 'package:route_app/features/cart/data/repository/base_cart_repository.dart';

import '../../../../core/constance.dart';

class CartRepositoriesImplementation implements BaseCartRepository{

  final ApiService apiService;

  CartRepositoriesImplementation(this.apiService);

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

  @override
  Future<Either<Failure, CartsModel>> getCarts() async{

    try {
      var data = await apiService.getData(
        endPoint: 'carts',
        token: token,
      );
      CartsModel cartModel = CartsModel.fromJson(data);
      return right(cartModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

}