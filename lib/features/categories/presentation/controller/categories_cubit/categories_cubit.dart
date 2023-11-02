import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/features/categories/data/repository/base_categories_repository.dart';
import '../../../../home/data/model/categories_model/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.baseCategoriesRepository) : super(CategoriesInitial());

  final BaseCategoriesRepository baseCategoriesRepository;

  static CategoriesCubit get(context)=>BlocProvider.of(context);

  CategoriesModel? categoriesModel1;
  Failure? failure1;


  Future<void> getCategoriesData()async {

    emit(GetCategoriesLoadingState());

    var result = await baseCategoriesRepository.getCategoriesData();

    result.fold((failure) {
      failure1 = failure;
      emit(GetCategoriesFailureState(failure.toString()));
    }, (categoriesModel){
      categoriesModel1 = categoriesModel;
      emit(GetCategoriesSuccessState(categoriesModel));
    });
  }

  int currentIndex = 0;
  void changeTabIndex(int index){
    currentIndex = index;
    emit(ChangeTabIndexState());
  }
}
