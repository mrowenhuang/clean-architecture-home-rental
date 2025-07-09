part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final UserEntities? user;
  const AuthSuccessState({this.user});
}

final class AuthFailedState extends AuthState {
  final String message;

  const AuthFailedState({required this.message});
}


final class AuthSignoutFailed extends AuthState {
  final String message;

  const AuthSignoutFailed({required this.message});
}

final class AuthSignoutSuccess extends AuthState {}
