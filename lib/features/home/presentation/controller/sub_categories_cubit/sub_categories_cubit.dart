import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/home/data/repository/base_home_repositories.dart';
import '../../../../home/data/model/categories_model/categories_model.dart';
part 'sub_categories_state.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit(this.baseHomeHRepositories) : super(SubCategoriesInitial());


  final BaseHomeRepositories baseHomeHRepositories;

  Future<void> getSubCategoriesData() async{

    emit(GetSubCategoriesLoadingState());

    var result = await baseHomeHRepositories.getSubCategoriesData(limit: 10);

    result.fold((failure) {
      emit(GetSubCategoriesFailureState(failure.errMessage.toString()));
    }, (subCategoriesModel) {
      emit(GetSubCategoriesSuccessState(subCategoriesModel));
    });
  }
}
