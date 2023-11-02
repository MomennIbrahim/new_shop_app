import 'package:dartz/dartz.dart';
import 'package:route_app/core/error/error.dart';
import '../../../auth/data/model/user_model.dart';

abstract class BasePersonRepository {

  Future<Either<Failure, UserModel>> getPersonData();
  Future<Either<Failure, UserModel>> updatePersonData({
    required String name,
    required String email,
    required String phone,
  });

  Future<Either<Failure, UserModel>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

}
