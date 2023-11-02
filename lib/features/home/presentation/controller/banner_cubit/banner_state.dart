part of 'banner_cubit.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class ChangeIndicatorState extends BannerState {}

class GetBannerLoadingState extends BannerState {}
class GetBannerSuccessState extends BannerState {
  final BannerModel bannerModel;

  GetBannerSuccessState(this.bannerModel);
}
class GetBannerFailureState extends BannerState {
  final String errMessage;
  GetBannerFailureState(this.errMessage);
}

