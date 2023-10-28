import 'package:route_app/test/test_model.dart';

abstract class TestState {}

class TestInitial extends TestState {}

class SignUpInitial extends TestState {}

class SignUpLoadingState extends TestState {}

class SignUpSuccessState extends TestState {
  final TestModel userModel;

  SignUpSuccessState(this.userModel);
}
class SignUpFailureState extends TestState {

  final String errMessage;
  SignUpFailureState(this.errMessage);
}
