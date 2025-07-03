import 'package:clean_architecture_rental_room/core/failure/failures.dart';

import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AutoSigninAuth {
  final AuthRepositories _authRepositories;

  AutoSigninAuth(this._authRepositories);

  Future<Either<ServerFailure, String>> call() async {
    return await _authRepositories.autoSigninAuth();
  }
}
