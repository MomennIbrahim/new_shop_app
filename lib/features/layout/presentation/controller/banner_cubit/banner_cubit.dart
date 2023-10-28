import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/model/banner_model/banner_model.dart';
import '../../../data/repository/base_home_repository.dart';
part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this.baseHomeHRepository) : super(BannerInitial());

  final BaseHomeHRepository baseHomeHRepository;

  static BannerCubit get(context)=>BlocProvider.of(context);

  Future<void> getBannerData()async {

    emit(GetBannerLoadingState());

    var result = await baseHomeHRepository.getBannerData();

    result.fold((failure) {
      emit(GetBannerFailureState(failure.toString()));
    }, (bannerModel){
      emit(GetBannerSuccessState(bannerModel));
    });
  }
}
