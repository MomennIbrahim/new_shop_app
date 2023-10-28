import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/features/auth/presentation/controller/sign_up_cubit/sign_up_state.dart';
import '../../../data/repositories/base_auth_repository.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.baseAuthRepository) : super(SignUpInitialState());

  final BaseAuthRepository baseAuthRepository;

  static SignUpCubit get(context) => BlocProvider.of(context);

  bool isVisibility = true;
  Icon suffixIcon = const Icon(
    Icons.visibility,
  );

  void changeIconVisibility() {

    isVisibility = !isVisibility;
    isVisibility
        ? suffixIcon = const Icon(Icons.visibility)
        : suffixIcon = const Icon(Icons.visibility_off);
    emit(ChangeVisibilityState());

   }

  Future<void> userSignUp({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {

    emit(SignUpLoadingState());

    var result = await baseAuthRepository.userSignUp(
      email: email,
      password: password,
      phone: phone,
      name: name,
    );
    result.fold((failure) {
      emit(SignUpFailureState(failure.errMessage.toString()));
    }, (userModel) {
      emit(SignUpSuccessState(userModel));
    });
  }
}
