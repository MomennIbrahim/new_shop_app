import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_app/core/constance.dart';
import 'package:route_app/core/error/error.dart';
import 'package:route_app/core/utils/api_service.dart';
import 'package:route_app/features/auth/data/model/user_model.dart';
import 'package:route_app/features/person/data/repository/base_person_repository.dart';

class PersonRepositoryImplementation implements BasePersonRepository {
  ApiService apiService;

  PersonRepositoryImplementation(this.apiService);

  UserModel? userModel;

  @override
  Future<Either<Failure, UserModel>> getPersonData() async {
    try {
      var data = await apiService.getData(
        endPoint: 'profile',
        token: token,
      );
      userModel = UserModel.fromJson(data);

      return right(userModel!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> updatePersonData(
      {required String name,
      required String email,
      required String phone}) async {
    try {
      var data = await apiService.putData(
        endPoint: 'update-profile',
        token: token,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
        },
      );
      userModel = UserModel.fromJson(data);
      return right(userModel!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      var data = await apiService.postData(
        endPoint: 'change-password',
        token: token,
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );
      userModel = UserModel.fromJson(data);
      return right(userModel!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e.message));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
