part of 'person_cubit.dart';

@immutable
abstract class PersonState {}

class PersonInitial extends PersonState {}

class GetPersonLoadingState extends PersonState {}
class GetPersonSuccessState extends PersonState {
  final UserModel userModel;

  GetPersonSuccessState(this.userModel);
}
class GetPersonFailureState extends PersonState {
  final String errMessage;

  GetPersonFailureState(this.errMessage);
}


