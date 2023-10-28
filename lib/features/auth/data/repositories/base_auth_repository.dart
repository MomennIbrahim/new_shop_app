import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';
import '../model/user_model.dart';

abstract class BaseAuthRepository {

  Future<Either<Failure, UserModel>> userSignIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> userSignUp({
    required String email,
    required String password,
    required String phone,
    required String name,
  });
}
