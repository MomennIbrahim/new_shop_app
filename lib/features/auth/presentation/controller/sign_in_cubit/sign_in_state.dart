import '../../../data/model/user_model.dart';

abstract class SignInStates {}

class SignInInitial extends SignInStates {}

class ChangeVisibilityState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {
  final UserModel userModel;

  SignInSuccessState(this.userModel);
}
class SignInFailureState extends SignInStates {

  final String errMessage;
  SignInFailureState(this.errMessage);
}
