import 'package:dartz/dartz.dart';
import 'package:route_app/features/cart/data/model/add_cart_model.dart';
import 'package:route_app/features/cart/data/model/carts_model.dart';
import '../../../../core/error/error.dart';

abstract class BaseCartRepository{
  Future<Either<Failure, PostCartModel>> postCart({required int productId});
  Future<Either<Failure, CartsModel>> getCarts();
}