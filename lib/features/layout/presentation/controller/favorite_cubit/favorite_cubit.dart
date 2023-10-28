import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/layout/data/model/favorite_model/Favorite_model.dart';
import 'package:route_app/features/layout/data/repository/base_home_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.baseHomeHRepository) : super(FavoriteInitial());

  final BaseHomeHRepository baseHomeHRepository;

  static FavoriteCubit get(context) => BlocProvider.of(context);


  Future<void> getFavoriteData()async{

    var result = await baseHomeHRepository.getFavoriteData();

    result.fold((failure) {
      emit(FavoriteFailureState(failure.errMessage.toString()));
    }, (favoriteModel){
      emit(FavoriteSuccessState(favoriteModel));
    });
  }
}
