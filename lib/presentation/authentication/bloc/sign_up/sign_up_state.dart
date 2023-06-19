part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final String username;
  final String email;
  final String password;
  final bool isValid;

  const SignUpState({
    required this.username,
    required this.email,
    required this.password,
    required this.isValid,

  });

  @override
  List<Object?> get props => [username, email, password, isValid];

  SignUpState copyWith({
    String? username,
    String? email,
    String? password,
    bool? isValid,
  }) {
    return SignUpState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }
}

class SignUpInitial extends SignUpState {
  const SignUpInitial() : super(username: 'mateus', email: 'm@email.com', password: '12345678', isValid: true);

  @override
  List<Object> get props => [username, email, password, isValid];
}

class LogInImpl extends SignUpState{
  const LogInImpl({required super.username, required super.email, required super.password, required super.isValid});

  @override
  List<Object> get props => [username, email, password, isValid];
}

class Loged extends SignUpState {
  const Loged() : super(username: 'mateus', email: 'm@email.com', password: '12345678', isValid: true);

  @override
  List<Object> get props => [username, email, password, isValid];
}

class GoToSignIn extends SignUpState{
  const GoToSignIn() : super(username: '', email: '', password: '', isValid: true);
}