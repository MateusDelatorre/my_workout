import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationSignIn()) {
    on<Authenticate>(_onAuthenticate);
    on<AuthenticateSignInEvent>(_onAuthenticateSignIn);
    on<AuthenticateSignUpEvent>(_onAuthenticateSignUp);
  }

  void _onAuthenticate(
      Authenticate event,
      Emitter<AuthenticationState> emit,
      ) {
    emit(Authenticated());
  }

  void _onAuthenticateSignIn(
      AuthenticateSignInEvent event,
      Emitter<AuthenticationState> emit,
      ) {
    emit(AuthenticationSignIn());
  }

  void _onAuthenticateSignUp(
      AuthenticateSignUpEvent event,
      Emitter<AuthenticationState> emit,
      ) {
    emit(AuthenticationSignUp());
  }
}
