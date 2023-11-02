import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../cart/data/model/add_cart_model.dart';
import '../../../../home/data/repository/base_home_repositories.dart';
import '../../../data/model/product_model/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.baseHomeHRepositories) : super(ProductInitial());

  final BaseHomeRepositories baseHomeHRepositories;

  static ProductCubit get(context) => BlocProvider.of(context);

  ProductModel? productModel;

  Map<int, bool> carts = {};
  Map<int, bool> favorites = {};

  Future<void> getProductData() async {
    emit(GetProductDataLoadingState());
    var result = await baseHomeHRepositories.getProductData();
    result.fold((failure) {
      emit(GetProductDataFailureState(failure.errMessage.toString()));
    }, (model) {
      productModel = model;
      for (var element in productModel!.data!.products!) {
        carts.addAll({
          element.id! : element.inCart!,
        });
      }
      for (var element in productModel!.data!.products!) {
        favorites.addAll({
          element.id! : element.inFavorites!,
        });
      }
      emit(GetProductDataSuccessState(productModel!));
    });
  }

  Future<void> addProductInFavorite({required int productId}) async {

    favorites[productId] = !favorites[productId]!;
    emit(AddFavoriteLoadingState());

    var result = await baseHomeHRepositories.addProductInFavorite(productId: productId);
    result.fold((failure) {
      favorites[productId] = !favorites[productId]!;
      emit(AddFavoriteFailureState(failure.errMessage.toString()));
    }, (productModel) {
      if(!productModel.status!){
        favorites[productId] = !favorites[productId]!;
      }
      emit(AddFavoriteSuccessState(productModel));
    });
  }

  Future<void> addToCart({required int productId})async{

    carts[productId] = !carts[productId]!;
    emit(AddCartLoadingState());

    var result = await baseHomeHRepositories.postCart(productId: productId);
    result.fold((failure){
        carts[productId] = !carts[productId]!;
      emit(AddCartFailureState(failure.errMessage));
    }, (postCartModel){
      if(!productModel!.status!){
        carts[productId] = !carts[productId]!;
      }
      emit(AddCartSuccessState(postCartModel));
    });
  }


  int currentIndex=0;
  changeIndicator(index){
    currentIndex = index;
    emit(ChangeIndexOfIndicatorState());
  }
}
