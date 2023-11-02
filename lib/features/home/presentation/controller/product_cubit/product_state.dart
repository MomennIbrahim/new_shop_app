part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ChangeIndexOfIndicatorState extends ProductState {}

class ChangeFavoriteIconState extends ProductState{}

class GetProductDataLoadingState extends ProductState{}
class GetProductDataSuccessState extends ProductState{
  final ProductModel productModel;

  GetProductDataSuccessState(this.productModel);
}
class GetProductDataFailureState extends ProductState{
  final String errMessage;

  GetProductDataFailureState(this.errMessage);
}

class AddFavoriteLoadingState extends ProductState {}
class AddFavoriteSuccessState extends ProductState {
  final ProductModel productModel;

  AddFavoriteSuccessState(this.productModel);
}
class AddFavoriteFailureState extends ProductState {
  final String errMessage;

  AddFavoriteFailureState(this.errMessage);
}

class AddCartLoadingState extends ProductState {}
class AddCartSuccessState extends ProductState {

  final PostCartModel postCartModel;
  AddCartSuccessState(this.postCartModel);
}
class AddCartFailureState extends ProductState {
  final String errMessage;

  AddCartFailureState(this.errMessage);
}

