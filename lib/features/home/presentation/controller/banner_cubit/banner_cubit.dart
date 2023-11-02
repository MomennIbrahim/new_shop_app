import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../home/data/model/banner_model/banner_model.dart';
import '../../../../home/data/repository/base_home_repositories.dart';
part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this.baseHomeHRepositories) : super(BannerInitial());

  final BaseHomeRepositories baseHomeHRepositories;

  static BannerCubit get(context)=>BlocProvider.of(context);

  Future<void> getBannerData()async {

    emit(GetBannerLoadingState());

    var result = await baseHomeHRepositories.getBannerData();

    result.fold((failure) {
      emit(GetBannerFailureState(failure.toString()));
    }, (bannerModel){
      emit(GetBannerSuccessState(bannerModel));
    });
  }
}
