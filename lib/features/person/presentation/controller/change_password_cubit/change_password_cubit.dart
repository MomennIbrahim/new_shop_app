import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/auth/data/model/user_model.dart';
import 'package:route_app/features/person/data/repository/base_person_repository.dart';
import 'package:route_app/features/person/data/repository/person_repository_implementation.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.basePersonRepository)
      : super(ChangePasswordInitial());

  final BasePersonRepository basePersonRepository;

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

    var result = await basePersonRepository.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);

    result.fold((failure) {
      emit(ChangePasswordFailureState(failure.errMessage));
    }, (userModel){
      emit(ChangePasswordSuccessState(userModel));
    });
  }
}
