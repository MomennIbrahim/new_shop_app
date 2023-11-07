import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/favorite/data/repository/base_favorite_repository.dart';
import 'package:route_app/features/favorite/presentation/screens/favorite_screen/widgets/loading_favorite_item.dart';

import '../../../data/model/favorite_model/favorite_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.baseFavoriteRepository) : super(FavoriteInitial());

  final BaseFavoriteRepository baseFavoriteRepository;

  static FavoriteCubit get(context) => BlocProvider.of(context);

  FavoriteModel? favoriteModel1;

  Future<void> getFavoriteData() async {

    emit(FavoriteLoadingState());

    var result = await baseFavoriteRepository.getFavoriteData();

    result.fold((failure) {
      emit(FavoriteFailureState(failure.errMessage.toString()));
    }, (favoriteModel) {
      favoriteModel1 = favoriteModel;
      emit(FavoriteSuccessState(favoriteModel));
    });
  }
}
