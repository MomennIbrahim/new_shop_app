part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}
class FavoriteSuccessState extends FavoriteState {
  final FavoriteModel favoriteModel;
  FavoriteSuccessState(this.favoriteModel);
}
class FavoriteFailureState extends FavoriteState {
  final String errMessage;
  FavoriteFailureState(this.errMessage);
}
