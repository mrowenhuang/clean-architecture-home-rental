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
  final AutoSigninAuth _autoSignin;
  final AuthSignout _authSignout;

  AuthBloc(this._autoSignin, this._authSignout) : super(AuthInitial()) {
    on<InitialAuthEvent>(initialAuthEvent);
    on<SignoutAuthEvent>(signoutAuthEvent);
  }

  FutureOr<void> initialAuthEvent(
    InitialAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final response = await _autoSignin.call();

    response.fold(
      (failure) {
        print(failure.message);
        emit(AuthFailedState(message: failure.message));
      },
      (response) {
        print(response);
        emit(AuthSuccessState(user: response));
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
