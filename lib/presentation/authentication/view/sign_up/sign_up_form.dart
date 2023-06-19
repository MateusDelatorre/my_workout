import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/sign_up/sign_up_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state){
          if(state is Loged){
            context.read<AuthenticationBloc>().add(Authenticate());
          }else if(state is GoToSignIn){
            context.read<AuthenticationBloc>().add(AuthenticateSignInEvent());
          }
        },
        child: Align(
            alignment: const Alignment(0, -1 / 3),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _UsernameInput(),
                  const Padding(padding: EdgeInsets.all(12)),
                  _EmailInput(),
                  const Padding(padding: EdgeInsets.all(12)),
                  _PasswordInput(),
                  const Padding(padding: EdgeInsets.all(12)),
                  _SignUpButton(),
                  const Padding(padding: EdgeInsets.all(12)),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SignUpBloc>().add(const GoToSignInEvent());
                    },
                    child: const Text('Go to SignIn'),
                  )
                ],
              ),
            ),
        ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  TextEditingController controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<SignUpBloc>().add(SignUpUsernameChanged(username)),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'username',
            errorText: state.isValid ? null : '',
            //state.username.displayError != null ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<SignUpBloc>().add(SignUpEmailChanged(email)),
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
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
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

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return 1+1 == 3//state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.isValid
                    ? () {
                  context.read<SignUpBloc>().add(const SignUpSubmitted());
                }
                    : null,
                child: const Text('SignUp'),
            );
      },
    );
  }
}