part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();  

  @override
  List<Object> get props => [];
}
class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthInitial {}

final class AuthSignupSuccessState extends AuthInitial {}

final class AuthSignupFailedState extends AuthInitial {}


