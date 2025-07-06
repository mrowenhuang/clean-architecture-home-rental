import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/usecases/auth_signup.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthSignup _authSignup;

  RegisterBloc(this._authSignup) : super(RegisterInitial()) {
    on<SignupAuthEvent>(signupAuthEvent);
  }

  FutureOr<void> signupAuthEvent(
    SignupAuthEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(AuthSignupLoadingState());
    final response = await _authSignup.call(event.user);

    response.fold(
      (failure) {
        emit(AuthSingupFailedState(message: failure.message));
        emit(RegisterInitial());
      },
      (response) {
        emit(AuthSignupSuccessState(user: response));
      },
    );
  }
}
