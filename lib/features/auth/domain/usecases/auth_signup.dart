import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthSignup {
  final AuthRepositories _authRepositories;

  AuthSignup(this._authRepositories);

  Future<Either<ServerFailure, dynamic>> call(UserEntities user) async {
    return await _authRepositories.signupAuth(user);
  }
}
