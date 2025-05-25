import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositories {
  Future<Either<ServerFailure,UserCredential>> signupAuth(UserEntities user);
}