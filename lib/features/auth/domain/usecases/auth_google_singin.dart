import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthGoogleSingin {
  final AuthRepositories _authRepositories;

  AuthGoogleSingin(this._authRepositories);

  Future<Either<ServerFailure, UserEntities>> call() async {
    return await _authRepositories.signinGoogle();
  }
}
