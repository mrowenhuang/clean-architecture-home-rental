import 'package:clean_architecture_rental_room/features/auth/domain/repositories/auth_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGetCredential {
  final AuthRepositories _authRepositories;

  AuthGetCredential(this._authRepositories);

  Stream<User?> call() {
    return _authRepositories.getCredentialAuth;
  }
}
