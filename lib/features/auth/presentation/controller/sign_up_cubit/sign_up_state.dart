import '../../../data/model/user_model.dart';

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class ChangeVisibilityState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final UserModel userModel;

  SignUpSuccessState(this.userModel);
}
class SignUpFailureState extends SignUpStates {

  final String errMessage;
  SignUpFailureState(this.errMessage);
}
