part of 'authentication_bloc.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class Authenticate extends AuthenticationEvent{}

class AuthenticateSignInEvent extends AuthenticationEvent{}

class AuthenticateSignUpEvent extends AuthenticationEvent{}
