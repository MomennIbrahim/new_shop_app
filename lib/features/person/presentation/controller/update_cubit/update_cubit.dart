import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/auth/data/model/user_model.dart';
import 'package:route_app/features/person/data/repository/base_person_repository.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit(this.personRepository) : super(UpdateInitial());

  final BasePersonRepository personRepository;

  static UpdateCubit get(context) => BlocProvider.of(context);

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String email,
  }) async {
    emit(UpdateUserLoadingState());
    var result = await personRepository.updatePersonData(
      name: name,
      email: email,
      phone: phone,
    );

    result.fold((failure) {
      emit(UpdateUserFailureState(failure.errMessage));
    }, (userModel) {
      emit(UpdateUserSuccessState(userModel));
    });
  }
}
