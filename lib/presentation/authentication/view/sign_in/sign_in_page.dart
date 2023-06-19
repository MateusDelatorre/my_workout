import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/sign_in/sign_in_bloc.dart';
import 'package:my_workout/presentation/authentication/view/sign_in/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignUp')),
      body: BlocProvider(
        create: (context) {
          return SignInBloc();
        },
        child: const SignInForm(),
      ),
    );
  }
}
