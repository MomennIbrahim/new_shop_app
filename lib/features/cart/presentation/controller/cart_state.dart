part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetCartLoadingState extends CartState {}
class GetCartSuccessState extends CartState {

  final CartsModel cartsModel;
  GetCartSuccessState(this.cartsModel);
}
class GetCartFailureState extends CartState {
  final String errMessage;

  GetCartFailureState(this.errMessage);
}
