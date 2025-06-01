part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class InitialAuthEvent extends AuthEvent {}

final class SignupAuthEvent extends AuthEvent {
  final UserEntities user;

  const SignupAuthEvent({required this.user});
}

final class SinginAuthEvent extends AuthEvent {
  final UserEntities user;

  const SinginAuthEvent({required this.user});
}
