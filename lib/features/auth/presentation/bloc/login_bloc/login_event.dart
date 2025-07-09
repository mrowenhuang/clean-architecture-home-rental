part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class SinginAuthEvent extends LoginEvent {
  final UserEntities user;

  const SinginAuthEvent({required this.user});
}
