import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/data/models/user_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Stream<User?> get getCredential;
  Future<Either<ServerFailure, UserCredential>> signupAuth(UserModels user);
}

class ImplAuthRemoteDatasource extends AuthRemoteDatasource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  ImplAuthRemoteDatasource(this._firebaseAuth, this._firebaseFirestore);

  Stream<User?> get getCredential => _firebaseAuth.authStateChanges();

  @override
  Future<Either<ServerFailure, UserCredential>> signupAuth(
    UserModels user,
  ) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: user.email.toString(),
            password: user.password.toString(),
          )
          .then((value) {
            print(value);
            // _firebaseFirestore.collection('user').add({
            //   'id': value.credential
            // });
          });
    } catch (e) {
    }
  }
}
