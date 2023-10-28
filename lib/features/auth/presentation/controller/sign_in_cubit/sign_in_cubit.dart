import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/auth/presentation/controller/sign_in_cubit/sign_in_state.dart';
import '../../../data/model/user_model.dart';
import '../../../data/repositories/base_auth_repository.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit(this.baseAuthRepository) : super(SignInInitial());

  final BaseAuthRepository baseAuthRepository;

  static SignInCubit get(context) => BlocProvider.of(context);

  bool isVisibility = true;
  Icon suffixIcon = const Icon(Icons.visibility,);


  void changeIconVisibility() {
    isVisibility = !isVisibility;

    isVisibility
        ? suffixIcon = const Icon(Icons.visibility)
        : suffixIcon = const Icon(Icons.visibility_off);
    emit(ChangeVisibilityState());
  }

  Future<void> userSignIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());

    var result = await baseAuthRepository.userSignIn(
      email: email,
      password: password,
    );
    result.fold((failure) {
      emit(SignInFailureState(failure.errMessage.toString()));
    }, (userModel) {
      emit(SignInSuccessState(userModel));
    });
  }
}
