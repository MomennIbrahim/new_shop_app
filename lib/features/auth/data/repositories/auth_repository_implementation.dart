import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_app/core/utils/api_service.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/core/utils/end_points.dart';
import 'package:route_app/features/auth/data/repositories/base_auth_repository.dart';
import '../model/user_model.dart';

class AuthRepositoryImplementation implements BaseAuthRepository {
  ApiService apiService;

  AuthRepositoryImplementation(this.apiService);

  @override
  Future<Either<Failure, UserModel>> userSignIn({
    required String email,
    required String password,
  }) async {
    try {
      var data = await apiService.postData(
        endPoint: EndPoints.signIn,
        data: {
          'email': email,
          'password': password,
        },
      );

      UserModel userModel = UserModel.fromJson(data);
      return right(userModel);
    } catch (e) {
      if (e is DioException) {
        print('dio Ex :${e.response.toString()}');
        return left(ServerFailure.fromDioError(e.response!.data.toString()));
      } else {
        print('not dio Ex :${e.toString()}');
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> userSignUp({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {

      var data = await apiService.postData(
        endPoint: EndPoints.signUp,
        data: {
          'email': email,
          'password': password,
          'phone': phone,
          'name': name,
        },
      );

      UserModel userModel = UserModel.fromJson(data);
      return right(userModel);

    } catch (e) {
      if (e is DioException) {
        print('dio Ex :${e.response.toString()}');
        return left(ServerFailure.fromDioError(e.response!.data.toString()));
      } else {
        print('not dio Ex :${e.toString()}');
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
