part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final bool isValid;

  const SignInState({
    this.email = '',
    this.password = '',
    this.isValid = true,
  });

  @override
  List<Object?> get props => [email, password, isValid];

  SignInState copyWith({
    String? email,
    String? password,
    bool? isValid,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }
}

class SignInInitial extends SignInState {
  const SignInInitial();
}

class Finished extends SignInState{}

class GoToSignUp extends SignInState{}