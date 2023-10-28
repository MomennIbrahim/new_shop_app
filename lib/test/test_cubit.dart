import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_app/test/test_model.dart';
import 'package:route_app/test/test_state.dart';
import 'dio.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  static TestCubit get(context) => BlocProvider.of(context);

   TestModel? testModel ;

  void loginUser({
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(
        url: '/api/v1/auth/signin',
        data: {
          'email':email,
          'password':password,
        }
    ).then((value){
       testModel = TestModel.fromJson(value.data);
      emit(SignUpSuccessState(testModel!));
      print(testModel!.token);
    }).catchError((error){
      print(error.toString());
      emit(SignUpFailureState(error.toString()));
    });
  }

}
