part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthInitial {}

final class AuthSuccessState extends AuthInitial {
  final UserEntities? user;
  AuthSuccessState({this.user});
}

final class AuthFailedState extends AuthInitial {}

final class AuthSingupFailedState extends AuthInitial {
  final String message;

  AuthSingupFailedState({required this.message});
}

final class AuthSinginFailedState extends AuthInitial {
  final String message;

  AuthSinginFailedState({required this.message});
}
