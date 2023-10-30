import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/features/layout/data/repository/base_home_repository.dart';
import 'package:route_app/features/layout/presentation/controller/banner_cubit/banner_cubit.dart';
import '../../../data/model/product_model1/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.baseHomeHRepository) : super(ProductInitial());

  final BaseHomeHRepository baseHomeHRepository;

  static ProductCubit get(context) => BlocProvider.of(context);

  ProductModel? productModel1;
  Failure? failure1;

  Future<void> getProductData() async {
    emit(GetProductDataLoadingState());
    var result = await baseHomeHRepository.getProductData();
    result.fold((failure) {
      emit(GetProductDataFailureState(failure.errMessage.toString()));
    }, (productModel) {
      productModel1 = productModel;
      emit(GetProductDataSuccessState(productModel));
    });
  }

  Future<void> addProductInFavorite({required int productId}) async {

    emit(AddFavoriteLoadingState());

    var result = await baseHomeHRepository.addProductInFavorite(productId: productId);
    result.fold((failure) {
      failure1 = failure;
      emit(AddFavoriteFailureState(failure.errMessage.toString()));
    }, (productModel) {
      emit(AddFavoriteSuccessState(productModel));
    });
  }

  int currentIndex=0;

  changeIndicator(index){
    currentIndex = index;
    emit(ChangeIndexOfIndicatorState());
  }
}
