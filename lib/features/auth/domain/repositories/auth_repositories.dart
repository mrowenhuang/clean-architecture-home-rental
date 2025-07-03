import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositories {
  Future<Either<ServerFailure,UserEntities>> signupAuth(UserEntities user);
  Future<Either<ServerFailure,UserEntities>> singinAuth(UserEntities user);
  Future<Either<ServerFailure,String>> autoSigninAuth();
  Future<Either<ServerFailure,Unit>> signoutAuth();
  
}