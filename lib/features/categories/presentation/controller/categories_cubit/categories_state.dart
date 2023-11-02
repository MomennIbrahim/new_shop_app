part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class ChangeTabIndexState extends CategoriesState {}

class GetCategoriesLoadingState extends CategoriesState {}
class GetCategoriesSuccessState extends CategoriesState {
  final CategoriesModel categoriesModel;

  GetCategoriesSuccessState(this.categoriesModel);
}
class GetCategoriesFailureState extends CategoriesState {
  final String errMessage;

  GetCategoriesFailureState(this.errMessage);
}
