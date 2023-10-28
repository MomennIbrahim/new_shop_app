import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/layout/data/repository/base_home_repository.dart';
import '../../../data/model/categories_model/categories_model.dart';
part 'sub_categories_state.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit(this.baseHomeHRepository) : super(SubCategoriesInitial());


  final BaseHomeHRepository baseHomeHRepository;

  Future<void> getSubCategoriesData() async{

    emit(GetSubCategoriesLoadingState());

    var result = await baseHomeHRepository.getSubCategoriesData(limit: 10);

    result.fold((failure) {
      emit(GetSubCategoriesFailureState(failure.errMessage.toString()));
    }, (subCategoriesModel) {
      emit(GetSubCategoriesSuccessState(subCategoriesModel));
    });
  }
}
