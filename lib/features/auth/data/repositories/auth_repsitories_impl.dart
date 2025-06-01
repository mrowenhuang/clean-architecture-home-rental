import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:clean_architecture_rental_room/features/auth/data/models/user_models.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepsitoriesImpl implements AuthRepositories {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepsitoriesImpl(this._authRemoteDatasource);

  @override
  // TODO: implement getCredentialAuth
  Stream<User?> get getCredentialAuth => _authRemoteDatasource.getCredential;

  @override
  Future<Either<ServerFailure, Unit>> signupAuth(UserEntities user) async {
    try {
      final response = await _authRemoteDatasource.signupAuth(
        UserModels.fromEntity(user),
      );
      return response.fold(
        (failure) {
          return left(ServerFailure(message: failure.message));
        },
        (response) {
          return right(response);
        },
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
