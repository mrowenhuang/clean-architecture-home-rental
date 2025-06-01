import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_get_credential.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signup.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignup _authSignup;
  final AuthGetCredential _authGetCredential;

  AuthBloc(this._authSignup, this._authGetCredential) : super(AuthInitial()) {
    on<SignupAuthEvent>(signupAuthEvent);
    on<InitialAuthEvent>(initialAuthEvent);
  }

  FutureOr<void> signupAuthEvent(
    SignupAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _authSignup.call(event.user);

    response.fold(
      (failure) {
        print(failure.message);
      },
      (response) {
        print(response);
      },
    );
  }

  FutureOr<void> initialAuthEvent(
    InitialAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    await for (var data in _authGetCredential.call()) {
      print(data);
    }
  }
}
