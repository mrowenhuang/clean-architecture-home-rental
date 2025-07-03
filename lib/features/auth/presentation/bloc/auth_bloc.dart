import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signout.dart';

import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auto_signin_auth.dart';

import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signin.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signup.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignup _authSignup;
  final AuthSignin _authSignin;
  final AutoSigninAuth _autoSignin;
  final AuthSignout _authSignout;

  AuthBloc(
    this._authSignup,
    this._authSignin,
    this._autoSignin,
    this._authSignout,
  ) : super(AuthInitial()) {
    on<SignupAuthEvent>(signupAuthEvent);
    on<InitialAuthEvent>(initialAuthEvent);
    on<SinginAuthEvent>(singinAuthEvent);
    on<SignoutAuthEvent>(signoutAuthEvent);
  }

  FutureOr<void> signupAuthEvent(
    SignupAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _authSignup.call(event.user);

    response.fold(
      (failure) {
        emit(AuthSingupFailedState(message: failure.message));
      },
      (response) {
        AuthSuccessState(user: response);
      },
    );
  }

  FutureOr<void> initialAuthEvent(
    InitialAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _autoSignin.call();

    response.fold(
      (failure) {
        emit(AuthFailedState(message: failure.message));
      },
      (response) {
        if (JwtDecoder.isExpired(response)) {
          emit(AuthFailedState(message: "Exp Session"));
        } else {
          emit(AuthSuccessState());
        }
      },
    );
  }

  FutureOr<void> singinAuthEvent(
    SinginAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _authSignin.call(event.user);

    response.fold(
      (failure) {
        emit(AuthSinginFailedState(message: failure.message));
        emit(AuthInitial());
      },
      (response) {
        emit(AuthSuccessState());
      },
    );
  }

  FutureOr<void> signoutAuthEvent(
    SignoutAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _authSignout.call();

    response.fold(
      (failure) {
        emit(AuthSignoutFailed(message: failure.message));
      },
      (response) {
        emit(AuthSignoutSuccess());
      },
    );
  }
}
