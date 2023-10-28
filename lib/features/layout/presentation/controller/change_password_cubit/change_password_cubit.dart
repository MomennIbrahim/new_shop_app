import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/auth/data/model/user_model.dart';
import 'package:route_app/features/layout/data/repository/base_home_repository.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.baseHomeHRepository)
      : super(ChangePasswordInitial());

  final BaseHomeHRepository baseHomeHRepository;

  static ChangePasswordCubit get(context)=> BlocProvider.of(context);

  bool isVisibility = true;
  Icon suffixIcon = const Icon(Icons.visibility,);


  void changeIconVisibility() {
    isVisibility = !isVisibility;

    isVisibility
        ? suffixIcon = const Icon(Icons.visibility)
        : suffixIcon = const Icon(Icons.visibility_off);
    emit(ChangeVisibilityState());
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoadingState());

    var result = await baseHomeHRepository.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);

    result.fold((failure) {
      emit(ChangePasswordFailureState(failure.errMessage));
    }, (userModel){
      emit(ChangePasswordSuccessState(userModel));
    });
  }
}
