import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/sign_up/sign_up_bloc.dart';
import 'package:my_workout/presentation/authentication/view/sign_up/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignUp')),
      body: BlocProvider(
        create: (context) {
          return SignUpBloc();
        },
        child: const SignUpForm(),
      ),
    );
  }
}
