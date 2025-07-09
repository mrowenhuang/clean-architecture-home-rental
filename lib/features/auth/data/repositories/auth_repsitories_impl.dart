import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/data/datasources/local/auth_loacal_datasource.dart';
import 'package:clean_architecture_rental_room/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:clean_architecture_rental_room/features/auth/data/models/user_models.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepsitoriesImpl implements AuthRepositories {
  final AuthRemoteDatasource _authRemoteDatasource;
  final AuthLoacalDatasource _authLoacalDatasource;

  AuthRepsitoriesImpl(this._authRemoteDatasource, this._authLoacalDatasource);

  @override
  Future<Either<ServerFailure, UserEntities>> singinAuth(
    UserEntities user,
  ) async {
    try {
      final response = await _authRemoteDatasource.singinAuth(
        UserModels.fromEntity(user),
      );

      return response.fold(
        (failure) {
          return left(ServerFailure(message: failure.message));
        },
        (response) async {
          await _authLoacalDatasource.saveToken(response['token']);

          return right(UserModels.fromMap(response['user']));
        },
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, UserEntities>> signupAuth(
    UserEntities user,
  ) async {
    try {
      final response = await _authRemoteDatasource.signupAuth(
        UserModels.fromEntity(user),
      );

      return await response.fold(
        (failure) {
          return left(ServerFailure(message: failure.message));
        },
        (response) async {
          await _authLoacalDatasource.saveToken(response['token']);

          return right(UserModels.fromMap(response['user']));
        },
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, UserEntities>> autoSigninAuth() async {
    try {
      final response = await _authLoacalDatasource.getToken();

      if (response != null) {
        if (!JwtDecoder.isExpired(response)) {
          final userResponse = await _authRemoteDatasource.getUser();

          return userResponse.fold(
            (failure) {
              return left(ServerFailure(message: failure.message));
            },
            (response) {
              return right(UserModels.fromMap(response['user']));
            },
          );
        } else {
          await _authLoacalDatasource.deleteToken();
          return left(ServerFailure(message: "Token Is Expired"));
        }
      } else {
        return left(ServerFailure(message: 'No Token'));
      }
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Unit>> signoutAuth() async {
    try {
      await _authLoacalDatasource.deleteToken();

      return right(unit);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
