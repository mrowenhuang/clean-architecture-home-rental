import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/core/network/api_network.dart';
import 'package:clean_architecture_rental_room/features/auth/data/models/user_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Future<Either<ServerFailure, dynamic>> signupAuth(UserModels user);
  Future<Either<ServerFailure, dynamic>> singinAuth(UserModels user);
}

class ImplAuthRemoteDatasource extends AuthRemoteDatasource {
  final Dio _dio;

  ImplAuthRemoteDatasource(this._dio);

  @override
  Future<Either<ServerFailure, dynamic>> signupAuth(UserModels user) async {
    try {
      final response = await _dio.post(
        ApiNetwork.registerApi,
        data: {
          "username": user.username,
          "email": user.email,
          "password": user.password,
        },
      );

      if (response.statusCode == 201) {
        return right(response.data);
      } else {
        return left(ServerFailure(message: "Internal Server Error"));
      }
    } catch (e) {
      var err = (e as DioException).error as Map;
      return left(ServerFailure(message: err['message']));
    }
  }

  @override
  Future<Either<ServerFailure, dynamic>> singinAuth(UserModels user) async {
    try {
      final response = await _dio.post(
        ApiNetwork.loginApi,
        data: {'email': user.email, 'password': user.password},
      );

      if (response.statusCode == 200) {
        return right(response.data);
      } else {
        return left(ServerFailure(message: "Internal Server Error"));
      }
    } catch (e) {
      var err = (e as DioException).error as Map;

      return left(ServerFailure(message: err['message']));
    }
  }
}
