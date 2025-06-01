import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthSignin {
  final AuthRepositories _authRepositories;

  AuthSignin(this._authRepositories);

  Future<Either<ServerFailure, Unit>> call(UserEntities user) async {
    return await _authRepositories.singinAuth(user);
  }
}
