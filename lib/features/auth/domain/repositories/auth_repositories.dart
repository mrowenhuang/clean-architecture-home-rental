import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositories {
  Stream<User?> get getCredentialAuth;
  Future<Either<ServerFailure,Unit>> signupAuth(UserEntities user);
  Future<Either<ServerFailure,Unit>> singinAuth(UserEntities user);
  Future<Either<ServerFailure,UserEntities>> getUserAuth(String id);
  Future<Either<ServerFailure,UserEntities>> signinGoogle();
}