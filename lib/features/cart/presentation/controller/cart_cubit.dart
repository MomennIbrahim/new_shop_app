import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/cart/data/model/add_cart_model.dart';
import 'package:route_app/features/cart/data/model/carts_model.dart';
import 'package:route_app/features/cart/data/repository/base_cart_repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.baseCartRepository) : super(CartInitial());

  final BaseCartRepository baseCartRepository;

  static CartCubit get(context) => BlocProvider.of(context);

  Future<void> getCarts()async{

    emit(GetCartLoadingState());

    var result = await baseCartRepository.getCarts();
    result.fold((failure){
      emit(GetCartFailureState(failure.errMessage));
    }, (cartModel){
      emit(GetCartSuccessState(cartModel));
    });
  }
}