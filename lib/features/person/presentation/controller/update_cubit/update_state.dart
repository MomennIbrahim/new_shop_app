part of 'update_cubit.dart';

@immutable
abstract class UpdateState {}

class UpdateInitial extends UpdateState {}

class UpdateUserLoadingState extends UpdateState {}
class UpdateUserSuccessState extends UpdateState {
  final UserModel userModel;

  UpdateUserSuccessState(this.userModel);
}
class UpdateUserFailureState extends UpdateState {
  final String errMessage;

  UpdateUserFailureState(this.errMessage);
}


