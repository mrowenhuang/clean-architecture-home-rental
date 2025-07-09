part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class AuthSinginFailedState extends LoginState {
  final String message;

  const AuthSinginFailedState({required this.message});
}

final class AuthSinginLoadingState extends LoginState {}

final class AuthSigninSuccessState extends LoginState {
  final UserEntities user;

  const AuthSigninSuccessState({required this.user});

}
