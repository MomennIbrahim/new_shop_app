import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_app/features/layout/data/repository/base_home_repository.dart';
import '../../../../auth/data/model/user_model.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit(this.baseHomeHRepository) : super(PersonInitial());

  final BaseHomeHRepository baseHomeHRepository;

  static PersonCubit get(context) => BlocProvider.of(context);

  UserModel? userModel1;

  Future<void> getPersonData() async {
    var result = await baseHomeHRepository.getPersonData();

    result.fold((failure) {
      emit(GetPersonFailureState(failure.errMessage.toString()));
    }, (userModel) {
      userModel1 = userModel;
      emit(GetPersonSuccessState(userModel));
    });
  }
}
