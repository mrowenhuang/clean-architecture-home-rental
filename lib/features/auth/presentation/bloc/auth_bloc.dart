import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_get_credential.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_get_user.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_google_singin.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signin.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signup.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignup _authSignup;
  final AuthGetCredential _authGetCredential;
  final AuthSignin _authSignin;
  final AuthGetUser _authGetUser;
  final AuthGoogleSingin _authGoogleSingin;

  AuthBloc(
    this._authSignup,
    this._authGetCredential,
    this._authSignin,
    this._authGetUser,
    this._authGoogleSingin,
  ) : super(AuthInitial()) {
    on<SignupAuthEvent>(signupAuthEvent);
    on<InitialAuthEvent>(initialAuthEvent);
    on<SinginAuthEvent>(singinAuthEvent);
    on<SinginAuthGoogle>(singinAuthGoogle);
  }

  FutureOr<void> signupAuthEvent(
    SignupAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _authSignup.call(event.user);

    response.fold((failure) {
      emit(AuthSingupFailedState(message: failure.message));
    }, (response) {});
  }

  FutureOr<void> initialAuthEvent(
    InitialAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    await for (var data in _authGetCredential.call()) {
      if (data != null) {
        final response = await _authGetUser.call(data.uid);

        await response.fold(
          (failure) async {
            emit(AuthFailedState());
          },
          (response) async {
            emit(AuthSuccessState(user: response));
          },
        );
      } else {
        emit(AuthFailedState());
      }
    }
  }

  FutureOr<void> singinAuthEvent(
    SinginAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _authSignin.call(event.user);
    response.fold((failure) {
      emit(AuthSinginFailedState(message: failure.message));
    }, (response) {});
  }

  FutureOr<void> singinAuthGoogle(
    SinginAuthGoogle event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _authGoogleSingin.call();

    response.fold(
      (failure) {
        emit(AuthSinginFailedState(message: failure.message));
      },
      (response) {
        emit(AuthSuccessState(user: response));
      },
    );
  }
}
