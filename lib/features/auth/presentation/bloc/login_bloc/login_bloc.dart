import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signin.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthSignin _authSignin;

  LoginBloc(this._authSignin) : super(LoginInitial()) {
    on<SinginAuthEvent>(singinAuthEvent);
  }

  FutureOr<void> singinAuthEvent(
    SinginAuthEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(AuthSinginLoadingState());
    final response = await _authSignin.call(event.user);

    response.fold(
      (failure) {
        print(failure.message);
        emit(AuthSinginFailedState(message: failure.message));
        emit(LoginInitial());
      },
      (response) {
        print(response);
        emit(AuthSigninSuccessState(user: response));
      },
    );
  }
}
