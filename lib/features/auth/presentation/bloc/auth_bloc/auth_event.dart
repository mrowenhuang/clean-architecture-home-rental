part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class InitialAuthEvent extends AuthEvent {}



final class SignoutAuthEvent extends AuthEvent {}


