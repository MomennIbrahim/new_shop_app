part of 'sub_categories_cubit.dart';

@immutable
abstract class SubCategoriesState {}

class SubCategoriesInitial extends SubCategoriesState {}

class GetSubCategoriesLoadingState extends SubCategoriesState {}
class GetSubCategoriesSuccessState extends SubCategoriesState {
  final CategoriesModel categoriesModel;

  GetSubCategoriesSuccessState(this.categoriesModel);
}
class GetSubCategoriesFailureState extends SubCategoriesState {
  final String errMessage;

  GetSubCategoriesFailureState(this.errMessage);
}

