part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class GetSearchLoadingState extends SearchState {}
class GetSearchSuccessState extends SearchState {
  final SearchModel searchModel;

  GetSearchSuccessState(this.searchModel);
}
class GetSearchFailureState extends SearchState {
  final String errMessage;

  GetSearchFailureState(this.errMessage);
}
