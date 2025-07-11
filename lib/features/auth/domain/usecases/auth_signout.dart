import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthSignout {
  final AuthRepositories _authRepositories;

  AuthSignout(this._authRepositories);

  Future<Either<ServerFailure, Unit>> call() async {
    return await _authRepositories.signoutAuth();
  }
}
