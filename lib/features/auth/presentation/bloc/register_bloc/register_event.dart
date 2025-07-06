part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class SignupAuthEvent extends RegisterEvent {
  final UserEntities user;

  const SignupAuthEvent({required this.user});
}
