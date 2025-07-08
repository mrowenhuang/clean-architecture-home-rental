import 'package:clean_architecture_rental_room/core/failure/failures.dart';
import 'package:clean_architecture_rental_room/features/auth/data/models/user_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDatasource {
  Stream<User?> get getCredential;
  Future<Either<ServerFailure, Unit>> signupAuth(UserModels user);
  Future<Either<ServerFailure, Unit>> singinAuth(UserModels user);
  Future<Either<ServerFailure, DocumentSnapshot>> getUserAuth(String id);
  Future<Either<ServerFailure, UserCredential >> googleSignin();
}

class ImplAuthRemoteDatasource extends AuthRemoteDatasource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  ImplAuthRemoteDatasource(this._firebaseAuth, this._firebaseFirestore);

  @override
  Stream<User?> get getCredential => _firebaseAuth.authStateChanges();

  @override
  Future<Either<ServerFailure, Unit>> signupAuth(UserModels user) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: user.email.toString(),
            password: user.password.toString(),
          )
          .then((value) {
            _firebaseFirestore.collection('user').doc(value.user!.uid).set({
              'id': value.user!.uid,
              'username': user.username,
              'email': user.email,
              'created_at': value.user!.metadata.creationTime.toString(),
            });
          });
      return right(unit);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Unit>> singinAuth(UserModels user) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: user.email.toString(),
        password: user.password.toString(),
      );

      return right(unit);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, DocumentSnapshot>> getUserAuth(String id) async {
    try {
      final response =
          await _firebaseFirestore.collection('user').doc(id).get();
      return right(response);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, UserCredential>> googleSignin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final response = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      return right(response);
    } catch (e) {
      print(e.toString());
      return left(ServerFailure(message: e.toString()));
    }
  }
}
