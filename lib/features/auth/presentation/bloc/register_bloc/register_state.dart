part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class AuthSingupFailedState extends RegisterState {
  final String message;

  const AuthSingupFailedState({required this.message});
}

final class AuthSignupLoadingState extends RegisterState {}

final class AuthSignupSuccessState extends RegisterState {
  final UserEntities user;

  const AuthSignupSuccessState({required this.user});
}
