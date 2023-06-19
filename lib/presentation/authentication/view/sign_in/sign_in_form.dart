import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/sign_in/sign_in_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
        listener: (context, state){
          if(state is Finished){
            context.read<AuthenticationBloc>().add(Authenticate());
          }else if(state is GoToSignUp){
            context.read<AuthenticationBloc>().add(AuthenticateSignUpEvent());
          }
        },
        child: Align(
            alignment: const Alignment(0, -1 / 3),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _EmailInput(),
                  const Padding(padding: EdgeInsets.all(12)),
                  _PasswordInput(),
                  const Padding(padding: EdgeInsets.all(12)),
                  _SignInButton(),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SignInBloc>().add(const GoToSignUpEvent());
                    },
                    child: const Text('Go to SignUp'),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<SignInBloc>().add(SignInEmailChanged(email)),
          decoration: InputDecoration(
              labelText: 'email',
              errorText: state.isValid ? null : '',
            //state.username.displayError != null ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignInBloc>().add(SignInPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            errorText: state.isValid ? null : '',
            //state.password.displayError != null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return 1+1 == 3//state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.isValid
                    ? () {
                  context.read<SignInBloc>().add(const SignInSubmitted());
                }
                    : null,
                child: const Text('SignIn'),
            );
      },
    );
  }
}