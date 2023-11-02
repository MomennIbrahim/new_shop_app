part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangeVisibilityState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}
class ChangePasswordSuccessState extends ChangePasswordState {
  final UserModel userModel;

  ChangePasswordSuccessState(this.userModel);
}
class ChangePasswordFailureState extends ChangePasswordState {
  final String errMessage;

  ChangePasswordFailureState(this.errMessage);
}

