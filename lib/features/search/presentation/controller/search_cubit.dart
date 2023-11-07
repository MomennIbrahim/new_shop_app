import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/search/data/repository/base_search_repository.dart';
import '../../data/model/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.baseSearchRepository) : super(SearchInitial());

  final BaseSearchRepository baseSearchRepository;

  static SearchCubit get(context)=> BlocProvider.of(context);

  SearchModel? model;

  Future<void> getSearchData({required String searchText})async {

    emit(GetSearchLoadingState());

    var result = await baseSearchRepository.getSearchData(searchText: searchText);

    result.fold((failure){
      emit(GetSearchFailureState(failure.errMessage.toString()));
    }, (searchModel){
      model = searchModel;
      emit(GetSearchSuccessState(searchModel));
    });
  }
}
